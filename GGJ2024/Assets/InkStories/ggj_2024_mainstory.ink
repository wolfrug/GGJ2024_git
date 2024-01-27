INCLUDE ggj2024_functions.ink

->start
==start
Heyho, let's test. First we make a rumour room randomly (we don't know what it is, it's a secret). {SetRandomRumourRoom()}
~eliminatedRooms = ()
->selectRoom
=selectRoom
{attemptsLeft<2:
{EliminateAllGatherRooms()} // if we have one attempt left, we only allow direct guesses
}
We have {attemptsLeft} attempts left!
<-AdjustBet(->selectRoom)
{betConfidence==0:
You must bet some confidence to continue!
- else:
->GoToRoom(->roomEnd)
}
=roomEnd(room)
We ended up in {room}! This room contains: {ContainedRooms(room)}. The payout for this room, if correct, is {RoomPayout(room)}.

Our current room {ContainsRumourRoom(room): contains|does not contain} the rumour room! {EliminateRoomsIfGuaranteedEmpty(room)}

Eliminated rooms so far: {eliminatedRooms}

{rumourRoom==room:
->win
}
{ContainsRumourRoom(room):
We eliminated an extra wrong room, {BonusRoomEliminationOnCorrectGuess()}, thanks to your correct guess!
}
Your payout was: {GetPayout(room)}
~attemptsLeft--
{attemptsLeft>0:
->selectRoom
- else:
->lose
}
=lose
That's the end of our attempts. We did not find it :( The room was: {rumourRoom}. Our confidence at the end was: {confidence}
->END
=win
We did it! Yay! (the room was {rumourRoom}! Your payout was: {GetPayout(rumourRoom)}, and your final confidence {confidence}!
->END