LIST MirthFactors = Angry, VeryBored, Bored, NotAmused, LightlyAmused, Amused, VeryAmused, Laughing

LIST BossFavor = Unfavored, Neutral, Favored

VAR bossMirth = NotAmused

VAR yourBossFavor = Neutral

VAR rivalBossFavor = Neutral

==InsultBattle

Time to do an insult battle! Woo!

{currentTarget:

-Astaroth:

->Astaroth_Battle

-Naberius:

->Naberius_Battle

-Byleth:

->Byleth_Battle

}

=endBattle

{bossMirth>VeryAmused:

->MakeHimLaugh

- else:

You did not make the boss laugh, this time.

}

We have finished the battle! On to the next target!

~currentTarget++

->start

==Astaroth_Battle

This is the battle with Astaroth! Time to fling some insults.

      //Make this shuffle through a list so the text doesn't repeat.

{->round_1|->round_2|->round_3|->endBattle}

=round_1

Options to insult Astaroth in round 1!

* [Stupid jest.]

You make an underhanded comment about Asteroth's personal hygiene. Those jokes always work. Surely?

~bossMirth--

~yourBossFavor--

* {confidence>=100} [Bold lie. (Costs 100 Confidence)]

"I would say we stand in fine company this night, but I have just noticed the presence of my lord amidst the crowd. I shall amend my statements accordingly."

~confidence-=100

~bossMirth++

* {knownRumours?BoughtYarn} [Talk about buying yarn.]

"What's with all the yarn you've been buying lately. Are you knitting together some new woolly political scheme, or did you just recently acquire a pet frost giant?"

~bossMirth+=2

~yourBossFavor++

- 

->round_1_rival->

->Astaroth_Battle

=round_1_rival

{rivalKnownRumours?BoughtYarn:

Your rival expounds on the threads of fate that weave us all together, and how even the simplest yarn can have a purpose, and be used to strengthen the bonds between factions. Nonsense, frippery, but the crowd seems to like it.

~bossMirth--

~rivalBossFavor++

- else:

Your rival makes a derivative pun about cats and balls of yarn. A lone demon claps awkwardly from the back of the crowd as she takes her parting bow.

}

->->

=round_2

Options to insult Astaroth in round 2!

* [Stupid jest.]

Make an ill-conceived joke about Asteroth being a math nerd. 

~bossMirth--

~yourBossFavor--

* {confidence>=100} [Bold lie. (Costs 100 Confidence)]

~confidence-=100

"Please let us converse no longer, I would preserve my wit for those who have the acumen to appreciate it fully."

~bossMirth++

* {knownRumours?DiscussKnitting} [Talk about knitting.]

"Tell us, what wisdom did the soul of this damned grandmother impart? Are the knots a euphemism for something perhaps, or have you stumbled across a new hobby?" 

~bossMirth+=2

~yourBossFavor++

- 

->round_2_rival->

->Astaroth_Battle

=round_2_rival

{rivalKnownRumours?DiscussKnitting:

Your rival expounds on the virtues of working with one's hands, and suggests that one must be sharp of wit to wield a needle with acumen. 

~bossMirth--

~rivalBossFavor++

- else:

Your rival starts a mildly diverting tangent on knitting needles, but loses her train of thought halfway through and gets tangled up in her own words. Unfortunate.

}

->->

=round_3

Options to insult Astaroth in round 3!

* [Stupid jest.]

You draw an unfavourable comparison between the size of the crown on Asteroth's head, and other body parts that they may or may not possess. The crowd doesn't get it.

~bossMirth--

* {confidence>=100}[Bold lie. (Costs 100 Confidence)]

~confidence-=100

Make up something about Asteroth's love for handicrafts, highlight the silly contrast between such cutesy pursuits and the otherwise severe reputation of the leader of Serpent House.

~bossMirth++

* {knownRumours?GiftedHats} [Talk about hats.]

Highlight the ludicrous concept of Asteroth, Prince of Hell, one of the Evil Trinity, Lord of the profane and unholy...knitting little hats for strangers. How did this come to pass? Is this a Demon Lord who stands before us, or some paltry imposter? How weak, how laughable. The crowd it seems would agree.

~bossMirth+=2

- 

->round_3_rival->

->Astaroth_Battle

=round_3_rival

{rivalKnownRumours?GiftedHats:

Your rival weaves together a touching, heartfelt tale about the lonely demons who guard the frozen outer realms. By the end of her speech even you have a tear in your eye. Off to one side you hear a Duke of Hell sniffle and remark to their companion, "wasn't it so kind of him, to knit them such warm and lovely hats."

~bossMirth--

~rivalBossFavor++

- else:

Your rival tells a generic joke to a smattering of polite laughter. You turn to one side to hide your smirk.

}

->->

=endBattle

Astaroth walks away, their face an expressionless mask. 

->InsultBattle.endBattle

==Naberius_Battle

This is the battle with Naberius! Time to fling some insults.

{->round_1|->round_2|->round_3|->endBattle}

=round_1

Options to insult Naberius in round 1!

* [Stupid jest.]

Make a silly joke about Naberius' hoarse voice, and suggest he should spend less time debating, and more time gargling.

~bossMirth--

* {confidence>=100} [Bold lie. (Costs 100 Confidence)]

~confidence-=100

"I would speak well of you if given half the chance, but alas nothing comes to mind."

~bossMirth++

* {knownRumours?NumerousVisits} [Talk about recent travels.]

What could such an upstanding demon be doing on the mortal plane? The frequency of his visits suggest a juicy secret waiting to be uncovered, and you make sure the crowd has many wild possibilities to ponder.

~bossMirth+=2

- 

->round_1_rival->

->Naberius_Battle

=round_1_rival

{rivalKnownRumours?NumerousVisits:

Your rival spins a story.

~bossMirth--

~rivalBossFavor++

- else:

Generic rival joke.

}

->->

=round_2

Options to insult Naberius in round 2!

* [Stupid jest.]

"Here boy, fetch!"

~bossMirth--

* {confidence>=100} [Bold lie. (Costs 100 Confidence)]

~confidence-=100

"I have been known on occasion to refer to myself as a fool, but it seems churlish to do so now when in the presence of one so truly foolish."

~bossMirth++

* {knownRumours?SmuggledSacks} [Talk about smuggling.]

Just what is it that Naberius the valiant is smuggling into his household in such large burlap sacks? You leave the details to the imagination of your audience, but make sure to draw some amusing connections between several unsavoury pursuits that Naberius is widely known to look down upon. It seems to go over well with the crowd.

~bossMirth+=2

- 

->round_2_rival->

->Naberius_Battle

=round_2_rival

{rivalKnownRumours?NumerousVisits:

Your rival spins a story.

~bossMirth--

~rivalBossFavor++

- else:

Generic rival joke.

}

->->

=round_3

Options to insult Naberius in round 1!

* [Stupid jest.]

Make a snide comment about Naberius' canine attributes and suggest he is in need of a dog treat.

~bossMirth--

* {confidence>=100}[Bold lie. (Costs 100 Confidence)]

~confidence-=100

"Please save us from your rhetoric, you may think it is your wit that makes us fall prey to your arguments, but alas it is the foulness of your breath that is the true leveller in this hall." 

~bossMirth++

* {knownRumours?HumanLover} [Talk about human companionship.]

"What's this, a reversal in fortunes? On the mortal plane it is mankind who keeps their canine compatriots as pets, but here in Hell our own faithful Naberius has turned the tables and now takes in stray humans? What perverse fetish is this? And from such a renowned and dignified figure? How pitiful, how base, how unclean." The crowd snickers in agreement. 

~bossMirth+=2

- 

->round_3_rival->

->Naberius_Battle

=round_3_rival

{rivalKnownRumours?NumerousVisits:

Your rival spins a story.

~bossMirth--

~rivalBossFavor++

- else:

Generic rival joke.

}

->->

=endBattle

Naberius walks away.

->InsultBattle.endBattle

==Byleth_Battle

This is the battle with byleth! Time to fling some insults.

{->round_1|->round_2|->round_3|->endBattle}

=round_1

Options to insult Byleth in round 1!

* [Stupid jest.]

"Have you heard the joke about the cat and the hairball? Anyone? Nope?"

~bossMirth--

* {confidence>=100} [Bold lie. (Costs 100 Confidence)]

~confidence-=100

"Please, let us not tarry together much longer, your presence lingers on the mind like the aftertaste of old vinegar."

~bossMirth++

* {knownRumours?TouchyTrumpet} [Talk about his trumpet playing.]

"I'm sure everyone here knows by now that bringing up Byleth's trumpet playing is a surefire way to get clawed across the face. Pity the old cat can't take a joke. His music certainly can though..."

~bossMirth+=2

- 

->round_1_rival->

->Byleth_Battle

=round_1_rival

{rivalKnownRumours?TouchyTrumpet:

"what's this, Byleth gets touchy when you talk about his trumpet?" You rival winks at the crowd, and embarks on one of the lewdest, wildest jokes you ever heard. By the end of it even Byleth is laughing.

~bossMirth--

~rivalBossFavor++

- else:

Your rival's joke veers dangerously close to the brink of silliness, and then teeters abruptly over the edge of absurdity. You flinch in sympathy.

}

->->

=round_2

Options to insult Byleth in round 2!

* [Stupid jest.]

Make some asinine jest about cat litter. I mean really even you are embarrassed, he only looks like a cat.

~bossMirth--

* {confidence>=100} [Bold lie. (Costs 100 Confidence)]

~confidence-=100

"Thou hast the complexion of cream; as pale as a loon, and somewhat curdled."

~bossMirth++

* {knownRumours?SheetMusic} [Talk about sheet music.]

Numerous little birds have told me that Byleth was recently seen reading copious amounts of sheet music. Alas, the little birds couldn't tell me anything further, as Byleth caught and ate every one of them.

~bossMirth+=2

- 

->round_2_rival->

->Byleth_Battle

=round_2_rival

{rivalKnownRumours?SheetMusic:

Your rival turns the subject matter into music, playing the attention of the crowd as though there were strings upon the fiddle of her wit. You're supposed to compete with this?

~bossMirth--

~rivalBossFavor++

- else:

Alas, your rivals riposte is less music to the ears, and more like the yowling of tomcats. Ouch.

}

->->

=round_3

Options to insult Byleth in round 3!

* [Stupid jest.]

"Heaven may have a choir of angels, but we have a cacophony of cats! Or...cat. Singular."

~bossMirth--

* {confidence>=100}[Bold lie. (Costs 100 Confidence)]

~confidence-=100

~bossMirth++

* {knownRumours?MusicLessons} [Talk about Orpheus.]

The rumour mill says that Byleth recently started taking lessons from the famous Orpheus, the bard of the underworld himself! Alas, even such a famous tutor can't compensate for being tone deaf. Poor Byleth, I'm afraid that ship has sailed. Maybe try something more suited to your talents, like terrifying clergymen or chasing mice?

~bossMirth+=2

- 

->round_3_rival->

->Byleth_Battle

=round_3_rival

{rivalKnownRumours?MusicLessons:

Whatever story you spun, she does it better, with far fewer cat puns and far more incisive witticisms. The crowd laps it up like the proverbial cat with the cream. Oh god, you just can't stop can you?

~bossMirth--

~rivalBossFavor++

- else:

Your rivals joke is as tone-deaf as Byleth himself.

}

->->

=endBattle

Byleth walks away.

->InsultBattle.endBattle

==MakeHimLaugh

You made him laugh, you win, end game. Lol.

->END