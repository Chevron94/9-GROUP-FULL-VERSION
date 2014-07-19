--\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
--==============================================================================
--**************************    Hyperspace Script    ***************************
--**********************    Created by Commander Cody    ***********************
--==============================================================================
--//////////////////////////////////////////////////////////////////////////////

require("PGStateMachine")
require("PGSpawnUnits")


function Definitions()
  
  Define_State("State_Init", State_Init)
  
end


function State_Init(message)
  local unit = nil
  if message == OnEnter then
    local unit_deposit = Find_Hint("MARKER_GENERIC_BLUE", "hyperspace_unit_deposit")
    Sleep(4.8)
    Object.Set_Selectable(false)
    unit = Create_Generic_Object("Skirmish_" .. string.sub(Object.Get_Type().Get_Name(),12), Object.Get_Position(), Object.Get_Owner())
    unit.Hide(true)
    BlockOnCommand(unit.Teleport_And_Face(Object))
    unit.Hide(false)
    Object.Set_Selectable(false)
	  Object.Teleport(unit_deposit)
	  Object.Prevent_All_Fire(true)
	  Object.Hide(true)
	  Object.Suspend_Locomotor(true)
	  Object.Prevent_AI_Usage(true)
	  Register_Death_Event(unit, Death_Callback)
	end
end


function Death_Callback()
  Object.Despawn()
end

