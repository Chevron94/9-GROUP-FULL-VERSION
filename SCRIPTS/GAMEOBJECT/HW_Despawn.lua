require("PGStateMachine")

function Definitions()
  Define_State("State_Init", State_Init)
end

function State_Init(message)
  if message == OnEnter then
    i = 0
  else
    i = i + 1
    if i == 15 then
      Object.Despawn()
    end
  end
end