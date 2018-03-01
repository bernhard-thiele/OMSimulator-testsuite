-- status: correct
-- teardown_command: rm -rf api-test02.log api_test02.xml api-test02_tmp

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

status = oms2_saveModel("api_test02.xml", "api_test02")
print("status code: " .. status)

status = oms2_unloadModel("api_test02")
print("status code: " .. status)

os.execute("cat api_test02.xml")

-- Result:
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
-- 			<Connection From="System1:F" To="System2:F">
-- 				<ssd:ConnectionGeometry pointsX="" pointsY="" />
-- 			</Connection>
-- 			<Connection From="System1:s" To="System2:s">
-- 				<ssd:ConnectionGeometry pointsX="" pointsY="" />
-- 			</Connection>
-- 			<Connection From="System1:v" To="System2:v">
-- 				<ssd:ConnectionGeometry pointsX="" pointsY="" />
-- 			</Connection>
-- 			<Connection From="System1:a" To="System2:a">
-- 				<ssd:ConnectionGeometry pointsX="" pointsY="" />
-- 			</Connection>
-- 		</Connections>
-- 	</FMICompositeModel>
-- 	<Experiment StartTime="0.000000" StopTime="1.000000" ResultFile="api_test02_res.mat" />
-- </ssd:SystemStructureDescription>
-- info:    Logging information has been saved to "api-test02.log"
-- endResult