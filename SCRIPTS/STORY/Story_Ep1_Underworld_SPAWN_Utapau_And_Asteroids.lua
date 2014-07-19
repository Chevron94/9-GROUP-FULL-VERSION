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
-- 
-- 
function Definitions()

	DebugMessage("%s -- In Definitions", tostring(Script))
	

	StoryModeEvents = 
	{
		Spawn_03				= State_Spawn_03,         
	}

		empire_fleet_1 =
		{
			"Star_Destroyer", 
			"Star_Destroyer", 
			"Star_Destroyer", 
			"Star_Destroyer", 
			"Star_Destroyer",
			"Imperial_Heavy_Scout_Squad",
			"Imperial_Heavy_Scout_Squad",
			"Imperial_Heavy_Scout_Squad",
			"Imperial_Heavy_Scout_Squad"
		}
		
		empire_fleet_2 =
		{
			"Star_Destroyer", 
			"Star_Destroyer", 
			"Star_Destroyer", 
			"Star_Destroyer", 
			"Star_Destroyer"
		}

end


function State_Spawn_03(message)
		if message == OnEnter then
		Utapau_pl = Find_First_Object("Utapau")
		Asteroids_pl = Find_First_Object("VergessoAsteroids")
		Empire_player = Find_Player("Empire")
		fleet3 = SpawnList(empire_fleet_1, Utapau_pl, Empire_player, true, false) 
		fleet4 = SpawnList(empire_fleet_2, Asteroids_pl, Empire_player, true, false) 
	end
end	

