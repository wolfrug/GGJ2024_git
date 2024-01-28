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

You have one opportunity left to choose and your opponent {~ comes to you.| might be able to help if you go to them.| could have some information to share.| suggests an exchange of information.| could throw you a morsel of information if you ask nicely - can you ask nicely?| might know something on the down low.| could be open to a little information bartering.| approaches you with an offer.| suggests pooling your efforts.}

+ [Speak to your rival.]

->Phase1

+ [Leave it alone.]

->endGameTheory(false)

=Phase1
{Phase1<2:
{Say(Rival)} Look, I know we don't always see to eye. But maybe we should give this a go...

{Say(Player)} Give a what now? Where? Who? US?! As in...we?

{Say(Rival)} You never know...it could be fun.

{Say(Rival)} Let's try it out, and trust one another for once.

{Say(Player)} Oh right, ahem, yeah. That's what you meant. Obviously.
- else:
{Say(Rival)} Back for more? Brave, aren't we?
}

The game is simple: you both write down the numbers you have narrowed yourselves down to, and hand it to the other. After that, you can see what overlaps, and remove anything that doesn't. Except, of course, if you lie...

~temp rivalAction = GetRivalTrustAction()

+ [Trust: tell her your actual remaining numbers. (You have narrowed it down to {CountRoomsRemaining()} numbers!)]

~playerLastTrustAction = WasCooperative

+ [Deceit: give her fake numbers.]

~playerLastTrustAction = BetrayOther

+ [Leave: do not play the game]

->endGameTheory(false)

-

{rivalAction:

- WasCooperative:

{~Her information is solid!|Surprise, surprise, the information she gave you was correct.|Perhaps this cooperation "thing" isn't so bad, her information proved useful.|Looks like this is a win/win situation, the info she gave you was useful.}

{EliminateOverlappingRooms(RoomsRemaining(), rivalRemainingRooms)}

{playerLastTrustAction?WasCooperative:

{&So was your information!|Look at the two of you, playing so well together.|All this honest is starting to become a habit.|You feel like you're building some real trust here.|Who knew Pan could be so reliable. Maybe you've judged her too harshly for all these years.}

~RivalTrust++

~rivalRemainingRooms = RoomsRemaining()

- else:

{&Unfortunately, your information wasn't! Alas, Pan can be vindictive when double-crossed like this. If you want her to trust you again you're going to have to put in the effort.|You however chose the path of betrayal. It's okay, probably. You can grovel for forgiveness later.|Too bad you lied to her, but she should have known better by now.|But you lied, again. You fiend.|The fact that she expects an ounce of honesty from you at this point is frankly astonishing.}

~RivalTrust--

->endGameTheory(true)

}

-BetrayOther:

{~You get fake, useless information. She betrayed you!|You compare the rooms, but soon realize none of them overlap with yours. She gave you fake information! The harridan!||It doesn't take you long to realize the rooms she gave you are all rooms you've already discarded. She tricked you!|You should have known better than to trust that IMP, the information she gave you was completely bogus.|Argh! Curse this sudden yet inevitable betrayal, she has set you on a false trail.}

{playerLastTrustAction?WasCooperative:

{~She now knows what you know!|You've shown her everything you know.|You've shared information in good faith.|You've unveiled all your secrets.|There are no secrets between you.}

{RivalEliminateOverlappingRooms()}

- else:

{~Of course, you betrayed her too, haha!|Mutual distrust, how fun!|Looks like neither of you are ready to share.|Everyone lied, big surprise.|Lying is a hard habit to break, let's give it one more try. I'll play nice, truly.}

->endGameTheory(true)

}

}

->endGameTheory(true) // there's a bool now for if you played the game or not at this point

=endGameTheory(playedGame)

{playedGame:

{playerLastTrustAction?WasCooperative && rivalLastTrustAction?WasCooperative:

{&We both cooperated, good job.|Everyone played fair.|You are Jesters in arms, striving to survive in this bleak Hellscape.|Trust is as trust...does?}

}

{playerLastTrustAction?BetrayOther && rivalLastTrustAction?BetrayOther:

{&We both betrayed each other, colour me shocked.|Alas, alack, neither of you are to be trusted.|You are both liars and con artists, was this outcome really surprising?|Why do you both persist in this little dance, neither one of you is going to give the information away for free.}

}

{playerLastTrustAction?BetrayOther && rivalLastTrustAction?WasCooperative:

{&I betrayed Pan's trust. But doesn't that make HER the fool?|Once again, I am a cad, lying to my compatriot.|Oops, I did it again.|Lying just comes so naturally to me, it really rolls of the tongue.|I am a humble Judas, betrayer of gullible fools.|Lies, upon lies, upon lies. She'll never trust me again.}

}

{playerLastTrustAction?WasCooperative && rivalLastTrustAction?BetrayOther:

{&Pan has betrayed me! I am...unsurprised, honestly.|Another day, another betrayal.|Why do I keep doing the same thing over and over again and expecting different results. Have I finally succumbed to madness?|It's okay, I'll keep doing what I believe is right, even if no one else does.|Betrayal, my old friend, we meet again!}

}

}

{RivalTrust:

-ZeroTrust:

{~She clearly has no trust in you.|Her distrust is palpable.|You can't blame her for not trusting you.|Unfortunately you've used up all her trust.|It would seem Pandemonium's trust has limits.|Trust schmust, you're here to win, not make friends.}

-VerySuspicious:

{~She remains very suspicious of you.|She doesn't seem to hold much stock in what you say.|Pan regards you with mistrust.}

-Suspicious:

{~Pan doesn't seem to trust you.|You need to work on your team-building.|Pan still seems a little suspicious about your motivations.|Pan squints at you with suspicion.}

{not playedGame:She's suspicious of you so you are suspicious of her. Best not to risk giving her an advantage only to be stabbed in the back!} 

-NeutralTrust:

{~Pan's feelings remain a enigma.|Your rival's expression remains an impenetrable mask.|Your rivals affections seem lukewarm at best.|You are neither worth of your rival's suspicion, nor her trust. You are nothing to her.}

-SomeTrust:

{~It seems she may trust you - just a smidgen.|Baby steps, but you seem to be gaining her trust.|You have a long way to go yet, but perhaps cooperation is possible.|Are you imagining things, or is her smirk just a little less condescending?|She seems to be warming to you...a little.}

-Trust:

{~She trusts you. How bizarre.|The two of you are actually getting along, how strange.|Why didn't you start trusting each other years ago?|This trust business isn't so hard.}

-FullTrust:

-{&You have her full trust, it seems.|It feels nice to have someone you can rely upon.|Perhaps one day you could be friends.|You've won her trust, somehow.}

}

// This is where they actually pick their last room, just realized this also needs to be in the "leave" option up above, lol

{RivalPickLastRoom()}

Either way, you now have {CountRoomsRemaining()} possible choices left!

->->