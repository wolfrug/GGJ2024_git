INCLUDE ggj2024_functions.ink
INCLUDE ggj2024_rivalinteractions.ink
INCLUDE ggj2024_battles.ink
INCLUDE ggj2024_rumours.ink
INCLUDE ggj2024_encounters.ink


->intro

==intro

{Background("Throne", "The Throne Room")} {Portrait(NoCharacter)}

//will the text scroll or must we manually break it up with clicking?

Welcome to Hell, literally. (CLICK THIS BOX TO CONTINUE)

Down here in the numberless realms where time is endless and death is cheap, the Dark Princes of Hell seek solace from eternity by any means necessary.

Alas, Buer - your Dark Prince and long-term Employer, has grown bored and has decided to host a party (otherwise known as an excuse for a lot of tomfoolery, backstabbing, and machiavellian machinations).

He expects to be amused as the factions of Hell vie for his favour, and as his Court Jester it is your tireless, thankless, truly awful task to make sure the event is as interesting as inhumanly possible.

+Alas, you do not shoulder this burden alone.

You share this task with your rival, your nemesis, and the thorn in your proverbial side ever since your youthful days of busking on banks of the river Styx.

Pan (Pandemonium to her enemies) is your Master's favourite little bloodhound, and together your shall compete for every morsel of attention that your master doles out. So you'd better act fast.

{Say(Rival)} Of course we could work together... 

{Say(Player)} But isn’t it so much more fun to compete against one another, consequences be damned?

{Say(Rival)} What could possibly go wrong? 

->tutorial

==tutorial

{Say(Player)}{Background("None", "")}

The party is underway, the plots are afoot, and rumours are rife. It's our job to sniff them out...together, you and me, and well...her.

{Say(Rival)} Hi again!

{Say(Player)} The premise is simple: just prowl the party looking for juicy rumours to amuse your Lord. 

You do this by playing a version of the Devil's own game: roulette!

There are 36 numbers on a roulette board - each one corresponding to a section of the party. In one (and only one) of them you will find a juicy tidbit that is sure to entertain your lord.

You have 4 attempts to narrow down exactly where it is. You do this by 'betting' Confidence (the most important quality for any jester!) on one of the spaces surrounding the central numbers (by clicking on it) such as 1 to 12, Even, Odd, or one of the Rows (Top, Mid, Bot). Each corresponds to a set of numbers.

Each guess you make will reveal or eliminate options from the board, narrowing down the possible locations. And guessing correctly nets you a return on invested Confidence, as well as a bonus cleared number!

You can of course also go wild and take a stab at a singular number, but that might not be the most strategic!

Once you have some fodder to work with (or not), it's time for a battle of wits with you-know-who.

{Say(Rival)} Yes, that'd be me. Hope you're feeling lucky!

{Say(Player)} Let's start with an easy one: I hear Dracula's somewhere out among the guests. Let's go see what he's up to!

->start

==start

#clearMainWriter 

{SetRandomRumourRoom()}

{PickRumour()}

{Background("Bar", "")}

Our mark is {currentTarget}.

// This bio is only shown the first time, note

->TargetBio(currentTarget)->

~eliminatedRooms = ()

~attemptsLeft = 4

->SimulateRun(true)->

+ [Begin]

{Portrait(Player)}

->selectRoom

=selectRoom

#showBets #updateRoomSelection

{attemptsLeft<2:

{EliminateAllGatherRooms()} // if we have one attempt left, we only allow direct guesses

}

SET_STORY_TEXT(AttemptsLeft, {attemptsLeft})

->GoToRoom(->roomEnd)

=roomEnd(room)

#updateRoomSelection #clearWriter

{rumourRoom==room:

{~This is it! You've found it! Haha! Let's see what's happening...|Oh, you're hearing something very juicy here...|Success! You found the rumour.}

->win

}

{ContainsRumourRoom(room):

{~Your sniffing around has brought results!|You feel yourself closing in on some yummy gossip.|Aha! Something is definitely afoot here.}

{BonusRoomEliminationOnCorrectGuess()} 

->CorrectBetEncounters->

- else:

{~No, this wasn't it. Damn.|No, it's not around here. But that's okay - process of elimination...|Nothing wagered, nothing gained. Still, it stings...}

}

{EliminateRoomsIfGuaranteedEmpty(room)} (Rumour narrowed down!)

{betConfidence>0:

Your Confidence payout was: {GetPayout(room)}

}

~attemptsLeft--

{attemptsLeft==1:

->GameTheory->

}

{attemptsLeft>0:

->selectRoom

- else:

->lose

}

=lose

You look at the clock: {readyToInsult: Time's up. Your mark is leaving.|Time for a break. You are exhaused.}

->endRound

=win

->Rumours->

->endRound

=endRound

{readyToInsult:

->InsultBattle

- else:

->Barfly_Encounters(false)->

You begin to hear whispers of a new rumour concerning your mark, {currentTarget}. No rest for the wicked - time to go!

}

->start