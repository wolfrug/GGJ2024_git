// interactions with your rival!

LIST RivalTrust = ZeroTrust, VerySuspicious, Suspicious, (NeutralTrust), SomeTrust, Trust, FullTrust

LIST TrustActions = BetrayOther, WasCooperative

VAR rivalRemainingRooms = ()

VAR rivalLastTrustAction = ()

VAR playerLastTrustAction = ()

VAR rivalLastRoom = ()

===function GetRivalTrustAction()

// Logic behind when she betrays or cooperates

// She will never cooperate if your last action was betrayal or if you reached ZeroTrust
{playerLastTrustAction?BetrayOther || RivalTrust?ZeroTrust:
~return BetrayOther
}
~temp trustChance = LIST_VALUE(RivalTrust) // base value is current trust
// chance to betray depends on number of remaining rooms (more rooms, more likely to trust)
~trustChance+=LIST_COUNT(rivalRemainingRooms)
// if we betrayed last time, we're a little more careful in case of betrayal
{rivalLastTrustAction?BetrayOther:
~trustChance=-5
}
{LIST_COUNT(rivalRemainingRooms)==1: // if we have one room left, it's harder to trust
{RivalTrust?FullTrust:
~return WasCooperative
- else:
~trustChance =-2
}
}
//random chance!
{RANDOM(1,10)<trustChance:
~return WasCooperative
-else:
~return BetrayOther
}

===function RivalEliminateOverlappingRooms()
~temp overlap = RoomsRemaining()^rivalRemainingRooms
~rivalRemainingRooms = overlap

===function RivalPickLastRoom()
~rivalLastRoom = LIST_RANDOM(rivalRemainingRooms)

==GameTheory

You have one opportunity left to choose and your opponent {RivalTrust>=Suspicious: comes to you.|might be able to help if you go to them.}

+ [Speak to your rival.]

->Phase1

+ [Leave it alone.]

->endGameTheory

=Phase1

Phase 1 is where you decide to trade known rooms or not. You reveal whether you did or not at the same time.

Rival: bla bla we should trust each other.
~temp rivalAction = GetRivalTrustAction()
+ [Trust: tell her your actual remaining rooms.]

~playerLastTrustAction = WasCooperative

+ [Deceit: give her fake rooms.]

~playerLastTrustAction = BetrayOther

+ [Leave: do not play the game]

->endGameTheory

-
{rivalAction:
- WasCooperative:
Her information is solid!
{EliminateOverlappingRooms(RoomsRemaining(), rivalRemainingRooms)}
{playerLastTrustAction?WasCooperative:
So was your information!
~RivalTrust++
~rivalRemainingRooms = RoomsRemaining()
- else:
Unfortunately, your information wasn't!
~RivalTrust--
->endGameTheory
}
-BetrayOther:
You get fake, useless information. She betrayed you!
{playerLastTrustAction?WasCooperative:
She now knows what you know!
{RivalEliminateOverlappingRooms()}
- else:
Of course, you betrayed her too, haha!
->endGameTheory
}
}

->endGameTheory


=endGameTheory
{playerLastTrustAction?WasCooperative && rivalLastTrustAction?WasCooperative:
We both cooperated.
}
{playerLastTrustAction?BetrayOther && rivalLastTrustAction?BetrayOther:
We both betrayed each other.
}
{playerLastTrustAction?BetrayOther && rivalLastTrustAction?WasCooperative:
Player betrayed rival.
}
{playerLastTrustAction?WasCooperative && rivalLastTrustAction?BetrayOther:
Rival betrayed player!
}
{RivalPickLastRoom()}
The end! The rival now picks their last room! DEBUG: The room they picked was: {rivalLastRoom}
DEBUG: Your remaining rooms are: {RoomsRemaining()}
Her remaining rooms are: {rivalRemainingRooms}

->->