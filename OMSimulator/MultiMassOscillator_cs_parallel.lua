-- status: correct
-- teardown_command: rm MultiMassOscillator_cs.log MultiMassOscillator_cs.mat

setLogFile("MultiMassOscillator_cs.log")

model = newModel()
setTempDirectory("./MultiMassOscillator_cs_tmp")

-- instantiate FMUs
instantiateFMU(model, "../FMUs/MultiMassOscillator.System1_cs.fmu", "System1")
instantiateFMU(model, "../FMUs/MultiMassOscillator.System2_cs.fmu", "System2")

-- add connections
addConnection(model, "System1.F", "System2.F")
addConnection(model, "System1.s", "System2.s")
addConnection(model, "System1.v", "System2.v")
addConnection(model, "System1.a", "System2.a")

setResultFile(model, "MultiMassOscillator_cs.mat")

setStopTime(model, 0.1)
setCommunicationInterval(model, 1e-5)

-- Master algorithm variants:
-- standard : The single-task standard
-- pmrchannela / pmrchannelcv: Channel based approach. Which one is actually active depends on #define in PMRChannel.h
-- pmrtaskpoola : "task pool" approach using atomic variables for synchronization
-- pmrtaskpoolcv : "task pool" approach using condition variables
-- pmrctpl : task pool approach using CTPL library (https://github.com/vit-vit/CTPL)
-- Caution: p
setMasterVariant(model, "pmrchannela")
setDisableResultWriting(model, 1)

--describe(model)

--exportDependencyGraph(model, "MultiMassOscillator_cs")
--os.execute("gvpr -c \"N[$.degree==0]{delete(root, $)}\" MultiMassOscillator_cs_simulation.dot | dot -Tpdf -o MultiMassOscillator_cs_simulation.pdf")
--os.execute("gvpr -c \"N[$.degree==0]{delete(root, $)}\" MultiMassOscillator_cs_initialization.dot | dot -Tpdf -o MultiMassOscillator_cs_initialization.pdf")

--exportCompositeStructure(model, "MultiMassOscillator_cs")
--os.execute("dot -Gsplines=none MultiMassOscillator_cs.dot | neato -n -Gsplines=ortho -Tpdf -oMultiMassOscillator_cs.pdf")

initialize(model)
simulate(model)

tcur = getCurrentTime(model)
vars = {"System1.s", "System2.mSDChain.flange_a.s"}
for _,var in ipairs(vars) do
  print(var .. " at " .. tcur .. ": " .. getReal(model, var))
end

terminate(model)

unload(model)

-- Result:
-- System1.s at 0.1: -0.44647144348144
-- System2.mSDChain.flange_a.s   at 0.1: -0.28277588561346
-- info:    1 warnings
-- info:    0 errors
-- info:    Logging information has been saved to "MultiMassOscillator_cd.log"
-- endResult
