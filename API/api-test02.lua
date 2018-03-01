-- status: correct
-- teardown_command: rm -rf api-test02.log api-test02_tmp

setLogFile("api-test02.log")
oms2_setLoggingLevel(0)

status = setTempDirectory("./api-test02_tmp")
print("status code: " .. status)

status = oms2_newFMIModel("api_test02")
print("status code: " .. status)

-- instantiate FMUs
status = oms2_instantiateFMU("api_test02", "../FMUs/DualMassOscillator.System1_me.fmu", "System1")
print("status code: " .. status)
status = oms2_instantiateFMU("api_test02", "../FMUs/DualMassOscillator.System2_me.fmu", "System2")
print("status code: " .. status)

-- add connections
oms2_addConnection("api_test02", "System1:F", "System2:F")
oms2_addConnection("api_test02", "System1:s", "System2:s")
oms2_addConnection("api_test02", "System1:v", "System2:v")
oms2_addConnection("api_test02", "System1:a", "System2:a")

status = oms2_unloadModel("api_test02")
print("status code: " .. status)

-- Result:
-- status code: 0
-- status code: 0
-- status code: 0
-- status code: 0
-- status code: 0
-- info:    Logging information has been saved to "api-test02.log"
-- endResult
