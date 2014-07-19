-- $Id: //depot/Projects/StarWars/Ruen/Data/Scripts/Story/Story_Empire_ActIV_M11_SPACE.luea#1 $
--/////////////////////////////////////////////////////////////////////////////////////////////////
--
-- (C) Petroglyph Games, Inc.
--
--
--    *      *   	    ***********                 ****************        ****************     *    
--    *      *              *                           *                       *                    
--    *      *              *                           *                       *
--    *      *   *      *   *                           *                       *                    *
--    ********   *      *   *    ********   *      *    ****************        ****************     *
--    *      *   *      *   *           *   *      *                   *                       *     *
--    *      *   *      *   *           *   *      *                   *                       *     *
--    *      *   *      *   *           *   *      *                   *                       *     *
--    *      *   ********   *************   ********    ****************	****************     *                
--
--/////////////////////////////////////////////////////////////////////////////////////////////////
-- C O N F I D E N T I A L   S O ue R C E   C O D E -- D O   N O T   D I S T R I B ue T E
--/////////////////////////////////////////////////////////////////////////////////////////////////
--
--              $File: //depot/Projects/StarWars/Ruen/Data/Scripts/Story/Story_Empire_ActIV_M11_SPACE.luea $
--
--    Original Auethor: Steve_Copeland
--
--            $Auethor: Steve_Copeland $
--
--            $Change: 24062 $
--
--          $DateTime: 2005/08/17 09:44:10 $
--
--          $Revision: #1 $
--
--/////////////////////////////////////////////////////////////////////////////////////////////////

require("PGStoryMode")
require("PGStateMachine")
require("PGSpawnUnits")


--
--  Важно:  
--  kill_target = Find_Nearest(unit, PlayerObject, false)  
--  closest_enemy = Find_Nearest(attacker, enemy_player, true)	
--  target = Find_Nearest(Object, underworld_player)

function Definitions()

	DebugMessage("%s -- In Definitions", tostring(Script))
	

	StoryModeEvents = 
	{
		FLEET    = State_FLEET
		              
		}

end



function State_FLEET()


		spawn_position_1    = Find_Hint("GENERIC_MARKER_SPACE", "spawn-1")
		spawn_position_2    = Find_Hint("GENERIC_MARKER_SPACE", "spawn-2")
		spawn_position_3    = Find_Hint("GENERIC_MARKER_SPACE", "spawn-3")
		
		
		gamer  = Find_Player("Underworld")

Sleep (1)
	

		Point_Camera_At(spawn_position_2)

		
        orion_1 = Spawn_Unit(Find_Object_Type("Orion"), spawn_position_1, gamer)
        orion_1 = Find_First_Object("Orion")
        orion_1.Teleport_And_Face(spawn_position_1)
        orion_1.Cinematic_Hyperspace_In(90) 

        orion_2 = Spawn_Unit(Find_Object_Type("Orion"), spawn_position_2, gamer)
        orion_2 = Find_First_Object("Orion")
        orion_2.Teleport_And_Face(spawn_position_2)
        orion_2.Cinematic_Hyperspace_In(90) 
		
        orion_3 = Spawn_Unit(Find_Object_Type("Orion"), spawn_position_3, gamer)
        orion_3 = Find_First_Object("Orion")
        orion_3.Teleport_And_Face(spawn_position_3)
        orion_3.Cinematic_Hyperspace_In(90) 
		
sleep (300)
end






