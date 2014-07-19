require("PGStateMachine")

function Definitions()
  ServiceRate=0,01
  Define_State("State_Init",State_Init)
  i=0
end

function State_Init()
--  if i==0 then
--    Object.Play_SFX_Event("Unit_Select_Tie_Defender")
--  else
  if i==180 then
    Object.Despawn()
  else
    i=i+1
  end
end
