LIST Dracula_Rumours = (DidNotStart), BloodSucker

LIST Astaroth_Rumours = (DidNotStart), BoughtYarn, DiscussKnitting, GiftedHats

LIST Naberius_Rumours = (DidNotStart), NumerousVisits, SmuggledSacks, HumanLover

LIST Byleth_Rumours = (DidNotStart), TouchyTrumpet, SheetMusic, MusicLessons

LIST Targets = Dracula, Astaroth, Naberius, Byleth, Buer, Alloces, Malphas

VAR currentRumour  = ()

VAR currentTarget = Dracula

VAR knownRumours = ()

VAR rivalKnownRumours = ()

VAR readyToInsult = false

==function PickRumour()

{currentTarget:

-Dracula:

~Dracula_Rumours++
{LIST_MAX(LIST_ALL(Dracula_Rumours))==Dracula_Rumours:
~readyToInsult = true
}
-Astaroth:

~Astaroth_Rumours++
{LIST_MAX(LIST_ALL(Astaroth_Rumours))==Astaroth_Rumours:
~readyToInsult = true
}
-Naberius:

~Naberius_Rumours++
{LIST_MAX(LIST_ALL(Naberius_Rumours))==Naberius_Rumours:
~readyToInsult = true
}

-Byleth:

~Byleth_Rumours++
{LIST_MAX(LIST_ALL(Byleth_Rumours))==Byleth_Rumours:
~readyToInsult = true
}
}

==TargetBio(target)

{currentTarget:

-Dracula:

{not DraculaBio:

->DraculaBio->

}

-Astaroth:

{not AstarothBio:

->AstarothBio->

}

-Naberius:

{not NaberiusBio:

->NaberiusBio->

}

-Byleth:

{not BylethBio:

->BylethBio->

}

}

->->

=DraculaBio

{Portrait(Dracula)}

He is Dracula, obviously. What, you didn't expect to see Dracula here? Why not, that's elitist. Why wouldn't Dracula be at this party? Indeed, can a party even be called such if Dracula is not present? Just look at him, magnificent.

->->

=AstarothBio

{Portrait(Astaroth)}

Astaroth, Heirarch of Serpent House, one of the Trinity of Evil (as he likes to remind everyone at every possible juncture), Lord of laziness, vanity, and philosophy. A bit of a math nerd. Bit of a dick.

->->

=NaberiusBio

{Portrait(Naberius)}

Naberius, a valiant Marquis of Hell. Dignified, eloquent, a bit stuck up but generally amiable and likeable sort of guy. Definitely not related to Cerberus, stop asking. Gosh. And it's NABERIUS, not "Nabbers".

->->

=BylethBio

{Portrait(Byleth)}

Byleth of the Order of Flies. A mighty and terrible warlord of Hell. Plays cacophonous music to terrify his foes. Treats everyone with disdain. Can be easily distracted bit of feather on a string. Tickle his tummy at your peril. 

->->

//Marchosias of Serpent House. A good boy. Also a good fighter. Never lies, very loyal, and like all good dogs he should have ended up in heaven, but here we are.

//Buer of the Order of Flies. Philosopher, physician, has a green thumb and knows the virtues of all herbs and plants and has very strong opinions on the uses of marjoram. Has resting bitch face but doesn't bite, honest.

==Rumours

{currentTarget:

-Dracula:

->Dracula_Rumour_Knots->

-Astaroth:

->Astaroth_Rumour_Knots->

-Naberius:

->Naberius_Rumour_Knots->

-Byleth:

->Byleth_Rumour_Knots->

}

->->

=Dracula_Rumour_Knots

He vants to suck your blood

{Dracula_Rumours:

-Dracula_Rumours.DidNotStart:

You're not actually looking for this!

-BloodSucker:

Likes a bit of the red from time to time, if you know what we mean.

~readyToInsult = true

}

~knownRumours+=Dracula_Rumours

->->

=Astaroth_Rumour_Knots

//Imposing, lazy, powerful, vain, math nerd - secret love of handicrafts, and crochet no less, ha and they always act so high and mighty.

{Astaroth_Rumours:

-Astaroth_Rumours.DidNotStart:

You're not actually looking for this!

-BoughtYarn:

Astaroth was seen purchasing numerous bags of yarn.

-DiscussKnitting:

Astaroth was caught discussing the finer points of knitting with a damned soul.

-GiftedHats:

Astaroth gave out knitted hats to the guard-demons in the frozen wastelands, because he thought they "looked a bit chilly".

~readyToInsult = true

}

~knownRumours+=Astaroth_Rumours

->->

=Naberius_Rumour_Knots

//Prideful, valiant, dignified, cunning, loves a good debate - collects stray human souls and keeps them as pets? Ugh, gross.

{Naberius_Rumours:

-Naberius_Rumours.DidNotStart:

You're not actually looking for this!

-NumerousVisits:

Naberius was seen visiting the mortal plane on numerous occasions.

-SmuggledSacks:

Naberius was seen smuggling large sacks into their residence.

-HumanLover:

Naberius has a soft spot for unlucky human souls, and likes to rehabilitate them.

~readyToInsult = true

}

~knownRumours+=Naberius_Rumours

->->

=Byleth_Rumour_Knots

//Cat. Very scary, an object of terror and worship - secretly yearns to make less cacophonous music and has been taking lessons from some greek bard in the underworld. Alas, the lessons have not helped.

{Byleth_Rumours:

-Byleth_Rumours.DidNotStart:

You're not actually looking for this!

-TouchyTrumpet:

Byleth gets upset if you comment on their trumpet playing.

-SheetMusic:

Byleth was seen reading sheet music in secret.

-MusicLessons:

Byleth was seen consorting with Orpheus in the underworld.

~readyToInsult = true

}

~knownRumours+=Byleth_Rumours

->->

//Buer

//Natural philosopher, healer of ailments - can't fix his own disappointing medical afflictions though.

//Buer the Healer was seen buying a questionable cure-all from a lesser demon.|Buer has been attempting to woo a middle-order Inferni without much success.|Buer has seemed rather morose lately.}

//Alloces

//Axe-weilding, bearded, ruddy complexion, burning eyes, general scary dude - scared of something really silly.

//Alloces always starts to sweat and leaves the room when Byleth enters, he claims he's allergic to cat hair.|Alloces is being blackmailed by Serpent House.|Alloces is secretly terrified of something innocuous.}

//Malphas

//Builder, con artist, loves a good sacrifice - conned a Prince of Hell and now he's planning to escape to the mortal plane and start a small business as a builder.

//Malphas the Mighty had a fall out with one of the Princes.|Malphas was seen practicing mortal guises and the drinking of tea.|Malphas has made enquiries about small business loans.}

