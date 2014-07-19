require("PGStateMachine")

function Definitions()
ServiceRate=0,01
Define_State("State_Init",State_Init)
st=-2
i=0
end

function State_Init()
if st==-1 then
if i==120 then
Object.Play_SFX_Event("Unit_Select_FTL")
Create_Generic_Object("Entry_effect_medium",Object,Object.Get_Owner())
Object.Make_Invulnerable(false)
Object.Hide(false)
Object.Prevent_All_Fire(false)
st=0
else
Object.Prevent_All_Fire(true)
Object.Make_Invulnerable(true)
Object.Hide(true)
i=i+1
end
elseif st==0 then
if Object.Is_Ability_Ready("WEAKEN_ENEMY")==true then
st=1
end
elseif st==1 then
if Object.Is_Ability_Ready("WEAKEN_ENEMY")==false then
Create_Generic_Object("FTL_Marker",Object,Object.Get_Owner())
StartPosMarker=Find_First_Object("FTL_Marker")
Create_Generic_Object("Entry_effect_medium",StartPosMarker,Object.Get_Owner())
--StartPosMarker.Attach_Particle_Effect("Medium_Explosion_Space")
st=2
end
elseif st==2 then
MarkerObj=Find_First_Object("Teleport_Marker")
Create_Generic_Object("Entry_effect_medium",MarkerObj,Object.Get_Owner())
--MarkerObj.Attach_Particle_Effect("Medium_Explosion_Space_Empire")
Object.Teleport(MarkerObj)
MarkerObj.Despawn()
st=3
elseif st==3 then
if Object.Is_Ability_Ready("WEAKEN_ENEMY")==true then
st=1
StartPosMarker.Despawn()
end
elseif Get_Game_Mode()~="Space" then
ScriptExit()
else
st=-1
end
end 