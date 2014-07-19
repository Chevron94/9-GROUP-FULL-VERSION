require("PGStateMachine")

function Definitions()
  ServiceRate=0,01
  Define_State("State_Init",State_Init)
  i=0
end

function State_Init()
-- if i==0 then
-- Object.Play_SFX_Event("Unit_Select_Tie_Defender")
-- else
  if i==153 then
  Create_Generic_Object("Jumphole_Distance",Object,Object.Get_Owner())
  k=Find_First_Object("Jumphole_Distance")
  Create_Generic_Object("Jumphole_Closing",k.Get_Bone_Position("OutOfMapPoint"),Object.Get_Owner())
  j=Find_First_Object("Jumphole_Closing")
  j.Hide(true)
  i=i+1
  elseif i==154 then
  j.Teleport_And_Face(Object)
  i=i+1
  elseif i==155 then
  j.Hide(false)
  k.Despawn()
  Object.Despawn()
  else
  i=i+1
  end
end