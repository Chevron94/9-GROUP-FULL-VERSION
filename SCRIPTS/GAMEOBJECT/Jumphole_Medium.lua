require("PGStateMachine")

function Definitions()
  ServiceRate=0,01
  Define_State("State_Init",State_Init)
  i=0
end

function State_Init()
  if i==0 then
  if Get_Game_Mode()~="Space" then
  ScriptExit()
  else
  Create_Generic_Object("Jumphole_Distance",Object,Object.Get_Owner())
  k=Find_First_Object("Jumphole_Distance")
  Create_Generic_Object("Jumphole_Opening",Object,Object.Get_Owner())
  j=Find_First_Object("Jumphole_Opening")
  i=1
  end
  elseif (i==2) or (i==3) then
  k.Teleport_And_Face(Object)
  j.Teleport_And_Face(Object)
  j.Teleport(k.Get_Bone_Position("JumpholeCreationPoint"))
  i=i+1
  elseif i==35 then
  Object.Make_Invulnerable(false)
  Object.Hide(false)
  Object.Prevent_All_Fire(false)
  k.Despawn()
  ScriptExit()
  else
  --//Object.Prevent_All_Fire(true)
  Object.Make_Invulnerable(true)
  Object.Hide(true)
  i=i+1
  end
end