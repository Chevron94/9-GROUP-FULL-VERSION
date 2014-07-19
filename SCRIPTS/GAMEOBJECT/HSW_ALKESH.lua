require("PGStateMachine")

function Definitions()
  ServiceRate = 0,01
  Define_State("State_Init", State_Init)
  Define_State("State_HW", State_HW)
end

function State_Init(message)
  if Get_Game_Mode() ~= "Space" then
    ScriptExit()
  else
    i = 0
    Set_Next_State("State_HW")
  end
end

function State_HW(message)
  if message == OnUpdate then
    if i == 60 then
      Create_Generic_Object("HSW_ALKESH", Object, Object.Get_Owner())
      i = i + 1
    elseif i == 90 then
      Object.Make_Invulnerable(false)
      Object.Hide(false)
      Object.Prevent_All_Fire(false)
      ScriptExit()
    else
--////Object.Prevent_All_Fire(true)
      Object.Make_Invulnerable(true)
      Object.Hide(true)
      i = i + 1
    end
  end
end