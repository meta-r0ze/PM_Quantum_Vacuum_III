import PMNested.General
import Lean

/-! The general-rules layer must not import the E8 example. -/
open Lean Elab Command in
run_cmd do
  let env ← getEnv
  for mod in env.allImportedModuleNames do
    if (`PMArch).isPrefixOf mod then
      throwError "General rules unexpectedly import the substrate example: {mod}"
    if (`PMNested).isPrefixOf mod &&
        !(`PMNested.General).isPrefixOf mod && mod != `PMNested.Interface then
      throwError "General rules unexpectedly import a constants module: {mod}"
  let mut checked : Nat := 0
  for (name, _) in env.constants.toList do
    let fromGeneral := match env.getModuleIdxFor? name with
      | some idx => (`PMNested.General).isPrefixOf env.allImportedModuleNames[idx.toNat]!
      | none => false
    if fromGeneral then
      for ax in ← Lean.collectAxioms name do
        unless ax == ``propext || ax == ``Classical.choice || ax == ``Quot.sound do
          throwError "Unapproved axiom {ax} in {name}"
      checked := checked + 1
  if checked == 0 then throwError "No general-rule declarations found"
  logInfo m!"Independent general-rules audit passed: {checked} declarations; no substrate/constants imports"
