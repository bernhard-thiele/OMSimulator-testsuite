-- status: correct
-- teardown_command: rm -rf api-test02.log api_test02.xml api_test02b.xml api-test02_tmp

setLogFile("api-test02.log")

status = oms2_setTempDirectory("./api-test02_tmp")
print("status code: " .. status)

status = oms2_newFMIModel("api_test02")
print("status code: " .. status)

-- add FMUs
status = oms2_addFMU("api_test02", "../FMUs/DualMassOscillator.System1_me.fmu", "System1")
print("status code: " .. status)
status = oms2_addFMU("api_test02", "../FMUs/DualMassOscillator.System2_me.fmu", "System2")
print("status code: " .. status)

-- add connections
status = oms2_addConnection("api_test02", "System1:F", "System2:F")
print("status code: " .. status)
status = oms2_addConnection("api_test02", "System1:s", "System2:s")
print("status code: " .. status)
status = oms2_addConnection("api_test02", "System1:v", "System2:v")
print("status code: " .. status)
status = oms2_addConnection("api_test02", "System1:a", "System2:a")
print("status code: " .. status)

status = oms2_saveModel("api_test02.xml", "api_test02")
print("status code: " .. status)

status = oms2_unloadModel("api_test02")
print("status code: " .. status)

status, ident = oms2_loadModel("api_test02.xml")
print("status code: " .. status .. " (" .. ident .. ")")

status = oms2_deleteConnection("api_test02", "System1:a", "System2:a")
print("status code: " .. status)
status = oms2_deleteConnection("api_test02", "System1:s", "System2:s")
print("status code: " .. status)
status = oms2_deleteConnection("api_test02", "System1:F", "System2:F")
print("status code: " .. status)
status = oms2_deleteConnection("api_test02", "System1:v", "System2:v")
print("status code: " .. status)

status = oms2_saveModel("api_test02b.xml", "api_test02")
print("status code: " .. status)

status = oms2_unloadModel("api_test02")
print("status code: " .. status)

os.execute("cat api_test02.xml")
os.execute("cat api_test02b.xml")

-- Result:
-- status code: 0
-- status code: 0
-- status code: 0
-- status code: 0
-- status code: 0
-- status code: 0
-- status code: 0
-- status code: 0
-- status code: 0
-- status code: 0
-- status code: 0 (api_test02)
-- status code: 0
-- status code: 0
-- status code: 0
-- status code: 0
-- status code: 0
-- status code: 0
-- <?xml version="1.0" encoding="UTF-8"?>
-- <ssd:SystemStructureDescription xmlns:ssc="http://www.pmsf.net/xsd/SystemStructureCommonDraft" xmlns:ssd="http://www.pmsf.net/xsd/SystemStructureDescriptionDraft" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:schemaLocation="http://www.pmsf.net/xsd/SystemStructureDescriptionDraft http://www.pmsf.net/xsd/SSP/Draft20170606/SystemStructureDescription.xsd">
-- 	<FMICompositeModel Name="api_test02">
-- 		<SubModel Name="System1" Type="FMU" ModelFile="../FMUs/DualMassOscillator.System1_me.fmu" />
-- 		<SubModel Name="System2" Type="FMU" ModelFile="../FMUs/DualMassOscillator.System2_me.fmu" />
-- 		<Connections>
-- 			<Connection From="System1:F" To="System2:F" />
-- 			<Connection From="System1:s" To="System2:s" />
-- 			<Connection From="System1:v" To="System2:v" />
-- 			<Connection From="System1:a" To="System2:a" />
-- 		</Connections>
-- 	</FMICompositeModel>
-- 	<Experiment StartTime="0.000000" StopTime="1.000000" ResultFile="api_test02_res.mat" />
-- </ssd:SystemStructureDescription>
-- <?xml version="1.0" encoding="UTF-8"?>
-- <ssd:SystemStructureDescription xmlns:ssc="http://www.pmsf.net/xsd/SystemStructureCommonDraft" xmlns:ssd="http://www.pmsf.net/xsd/SystemStructureDescriptionDraft" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:schemaLocation="http://www.pmsf.net/xsd/SystemStructureDescriptionDraft http://www.pmsf.net/xsd/SSP/Draft20170606/SystemStructureDescription.xsd">
-- 	<FMICompositeModel Name="api_test02">
-- 		<SubModel Name="System1" Type="FMU" ModelFile="../FMUs/DualMassOscillator.System1_me.fmu" />
-- 		<SubModel Name="System2" Type="FMU" ModelFile="../FMUs/DualMassOscillator.System2_me.fmu" />
-- 		<Connections />
-- 	</FMICompositeModel>
-- 	<Experiment StartTime="0.000000" StopTime="1.000000" ResultFile="api_test02_res.mat" />
-- </ssd:SystemStructureDescription>
-- info:    Logging information has been saved to "api-test02.log"
-- endResult
