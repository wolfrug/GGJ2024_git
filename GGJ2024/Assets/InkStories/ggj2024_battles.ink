LIST MirthFactors = Angry, VeryBored, Bored, NotAmused, LightlyAmused, Amused, VeryAmused, Laughing

LIST BossFavor = Unfavored, Neutral, Favored

VAR bossMirth = NotAmused

VAR yourBossFavor = Neutral

VAR rivalBossFavor = Neutral

==InsultBattle

{Background("Throne", "The Throne Room")} {Portrait(Buer)}

~bossMirth-- // we reduce mirth by one always

You approach the throne room, and your Dark Prince, Buer. Judging by the look on his face, he is <>

{bossMirth:

-Angry:

rather cross with you!

-VeryBored:

bored out of his mind.

-Bored:

bored.

-NotAmused:

not amused.

-LightlyAmused:

not entirely unamused.

-VeryAmused:

in a good mood!

-Laughing:

already laughing!

}

{currentTarget:

-Dracula:

->Dracula_Battle

-Astaroth:

->Astaroth_Battle

-Naberius:

->Naberius_Battle

-Byleth:

->Byleth_Battle

}

->OutOfContent

=endBattle

{Portrait(Buer)} 

As {currentTarget} leaves the throne room, you glance at your Dark Prince. <>

{bossMirth:

-Angry:

He looks furious. Uh-oh...

->MakeHimAngry

-VeryBored:

He looks extremely bored with the proceedings. This does not bode well for your future job prospects.

-Bored:

He looks bored. Clearly you were not very amusing.

-NotAmused:

He does not look amused. Ack and alack...

-LightlyAmused:

A small smile plays on his lips as he remembers some of your quips. Success..?

-VeryAmused:

He practically beams, a lion's hair's breadth from laughing. So close to success!

-Laughing:

Although it is slow at first, after a moment you are sure of it: he is laughing! He is actually laughing!

->MakeHimLaugh

}

{currentTarget==Byleth:

->OutOfContent

- else:

Be as it may, your job is not yet done. Another dignitary is on their way to attend your lord. Time to find some dirt!

~currentTarget++

~readyToInsult = false

->Barfly_Encounters(true)->
->start
}

==Dracula_Battle
{Dracula_Battle<2:
{Say(Rival)} Let's see what we can do with little old Vlad here!.

{Say(Dracula)} “Vait! Vhat am I doing here?”

{Say(Dracula)}“Vhy do I feel like you are going to start mocking my accent?”
}

{->round_1|->endBattle}

=round_1

{Say(Player)} Now, I should think of the perfect insult that will amuse my lord. Hmmm!

* [Stupid jest.]

"Dracula, more like Dragula am I right?" Don't be gauche. They're demons, not Americans and that sort of humour won't get you anywhere.  

~bossMirth--

~yourBossFavor--

* [{ReqConfidence(100)} Bold lie. (Costs 100 Confidence)]

You do a little riff on the different personality types who always show up at parties. 

{Say(Player)} "There's always one that one guy who tries too hard, right? And look, I'm not naming any names, but all I'll say is I'm guy who decided to rock up to this party wearing a CAPE. No, shhhh, don't look! You know he doesn't like to be in the spotlight, it reminds him too much of the sun."

~confidence-=100

~bossMirth++

* {knownRumours?BloodSucker} [Talk about drinking habits.]

"I thought I had a drinking problem, but take a look at this guy!" You begin slowly, and build from there. After all you have enough fodder to roast this individual for days. You are on fire, you are a god, and by the time you are done even Dracula himself cannot suppress his toothy smile.

~bossMirth+=2

~yourBossFavor++

- 

->round_1_rival->

->Dracula_Battle

=round_1_rival

{Portrait(Rival)}

{rivalKnownRumours?BloodSucker:

Pan smirks at you across the throne room, and you know you are done for. After all the subject matter is easy, the audience members practically fall into her hands. She is sharp, incisive, fresh. At the end Dracula comes up to her and shakes her hand. Wait, wasn't this an insult battle?

~bossMirth--

~rivalBossFavor++

- else:

Pan starts off with a dark quip about impaling people. It's a bit strong for the crowd, they haven't warmed up yet. Too bad. So sad.

}

->->

=endBattle

{Portrait(NoCharacter)}

Dracula raises a glass to his host with a gracious smile. 

{Say(Dracula)}"Thank you for ze entertainment." 

->InsultBattle.endBattle

==Astaroth_Battle
{Astaroth_Battle<2:
{Say(Player)} This is the real thing, so I better be on my toes! You don't know what's coming for you, Astaroth!
}

{->round_1|->round_2|->round_3|->endBattle}

=round_1

{Portrait(Astaroth)}

You try to think of what you learned about Astaroth in the beginning...

* [Stupid jest.]

You make an underhanded comment about Asteroth's personal hygiene. Those jokes always work. Surely?

~bossMirth--

~yourBossFavor--

* [{ReqConfidence(100)} Bold lie. (Costs 100 Confidence)]

{Say(Player)} "I would say we stand in fine company this night, but I have just noticed the presence of my lord amidst the crowd. I shall amend my statements accordingly."

~confidence-=100

~bossMirth++

* {knownRumours?BoughtYarn} [Talk about buying yarn.]

{Say(Player)} "What's with all the yarn you've been buying lately. Are you knitting together some new woolly political scheme, or did you just recently acquire a pet frost giant?"

~bossMirth+=2

~yourBossFavor++

- 

->round_1_rival->

->Astaroth_Battle

=round_1_rival

{Portrait(Rival)}

{rivalKnownRumours?BoughtYarn:

Your rival expounds on the threads of fate that weave us all together, and how even the simplest yarn can have a purpose, and be used to strengthen the bonds between factions. Nonsense, frippery, but the crowd seems to like it.

~bossMirth--

~rivalBossFavor++

- else:

Your rival makes a derivative pun about cats and balls of yarn. A lone demon claps awkwardly from the back of the crowd as she takes her parting bow.

}

->->

=round_2

{Portrait(Astaroth)}

It is not over yet! Astaroth shifts uncomfortably, trying to remain dignified.

* [Stupid jest.]

Make an ill-conceived joke about Asteroth being a math nerd. The numerous math nerds in the crowd are less than impressed.

~bossMirth--

~yourBossFavor--

* [{ReqConfidence(100)} Bold lie. (Costs 100 Confidence)]

~confidence-=100

{Say(Player)} "Please let us converse no longer, I would preserve my wit for those who have the acumen to appreciate it fully."

~bossMirth++

* {knownRumours?DiscussKnitting} [Talk about knitting.]

{Say(Player)} "Tell us, what wisdom did the soul of this damned grandmother impart? Are the knots a euphemism for something perhaps, or have you stumbled across a new hobby?" 

~bossMirth+=2

~yourBossFavor++

- 

->round_2_rival->

->Astaroth_Battle

=round_2_rival

{Portrait(Rival)}

{rivalKnownRumours?DiscussKnitting:

Your rival expounds on the virtues of working with one's hands, and suggests that one must be sharp of wit to wield a needle with acumen. 

~bossMirth--

~rivalBossFavor++

- else:

Your rival starts a mildly diverting tangent on knitting needles, but loses her train of thought halfway through and gets tangled up in her own words. Unfortunate.

}

->->

=round_3

{Portrait(Astaroth)}

The audience is drawing to a close. Astaroth is desperately trying to keep his cool.

* [Stupid jest.]

You draw an unfavourable comparison between the size of the crown on Asteroth's head, and other body parts that they may or may not possess. The crowd doesn't get it.

~bossMirth--

* [{ReqConfidence(100)} Bold lie. (Costs 100 Confidence)]

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

{Portrait(Rival)}

{rivalKnownRumours?GiftedHats:

Your rival weaves together a touching, heartfelt tale about the lonely demons who guard the frozen outer realms. By the end of her speech even you have a tear in your eye. Off to one side you hear a Duke of Hell sniffle and remark to their companion, "wasn't it so kind of him, to knit them such warm and lovely hats."

~bossMirth--

~rivalBossFavor++

- else:

Your rival tells a generic joke to a smattering of polite laughter. You turn to one side to hide your smirk.

}

->->

=endBattle

{Portrait(Astaroth)}

Astaroth walks away, their face an expressionless mask. 

->InsultBattle.endBattle

==Naberius_Battle

{Portrait(Naberius)}
{Naberius_Battle<2:
Naberius approaches. Two out of three of his heads ignore you.
}
{->round_1|->round_2|->round_3|->endBattle}

=round_1

{Portrait(Naberius)}

You consider which head to direct your insult at.

* [Stupid jest.]

Make a silly joke about Naberius' hoarse voice, and suggest he should spend less time debating, and more time gargling.

~bossMirth--

* [{ReqConfidence(100)} Bold lie. (Costs 100 Confidence)]

~confidence-=100

{Say(Player)} "I would speak well of you if given half the chance, but alas nothing comes to mind."

~bossMirth++

* {knownRumours?NumerousVisits} [Talk about recent travels.]

What could such an upstanding demon be doing on the mortal plane? The frequency of his visits suggest a juicy secret waiting to be uncovered, and you make sure the crowd has many wild possibilities to ponder.

~bossMirth+=2

- 

->round_1_rival->

->Naberius_Battle

=round_1_rival

{Portrait(Rival)}

{rivalKnownRumours?NumerousVisits:

There are many reasons why demons travel to the mortal realm, and in Pan's hands all of them seem equally hilarious. The crowd laughs, the crowd weeps. You cannot even hold it against them.

~bossMirth--

~rivalBossFavor++

- else:

Your rival starts off with a Cerberus allusion and Is quickly silenced by booing. This crowd does NOT like being compared to Tartarus. You make a mental note.

}

->->

=round_2

{Portrait(Naberius)}

Naberius's facade of dignity is beginning to crack!

* [Stupid jest.]

{Say(Player)} "Here boy, fetch!"

~bossMirth--

* [{ReqConfidence(100)} Bold lie. (Costs 100 Confidence)]

~confidence-=100

{Say(Player)} "I have been known on occasion to refer to myself as a fool, but it seems churlish to do so now when in the presence of one so truly foolish."

~bossMirth++

* {knownRumours?SmuggledSacks} [Talk about smuggling.]

Just what is it that Naberius the valiant is smuggling into his household in such large burlap sacks? You leave the details to the imagination of your audience, but make sure to draw some amusing connections between several unsavoury pursuits that Naberius is widely known to look down upon. It seems to go over well with the crowd.

~bossMirth+=2

- 

->round_2_rival->

->Naberius_Battle

=round_2_rival

{Portrait(Rival)}

{rivalKnownRumours?NumerousVisits:

Your rival has a nigh limitless supply of quips about the various objects one can smuggle in sacks, and amusing methods for identifying them. It's a silly joke, but it works.

~bossMirth--

~rivalBossFavor++

- else:

Pan's jibes start poorly, raise to passable in the middle, and then fall flat with all the grace of a popped balloon. Bad joke or just a tough crowd. Both.  Yes, both.

}

->->

=round_3

{Portrait(Naberius)}

He is wavering, he is about to crack. Only one head refuses to look away.

* [Stupid jest.]

Make a snide comment about Naberius' canine attributes and suggest he is in need of a dog treat.

~bossMirth--

* [{ReqConfidence(100)} Bold lie. (Costs 100 Confidence)]

~confidence-=100

{Say(Player)} "Please save us from your rhetoric, you may think it is your wit that makes us fall prey to your arguments, but alas it is the foulness of your breath that is the true leveller in this hall." 

~bossMirth++

* {knownRumours?HumanLover} [Talk about human companionship.]

{Say(Player)} "What's this, a reversal in fortunes? On the mortal plane it is mankind who keeps their canine compatriots as pets, but here in Hell our own faithful Naberius has turned the tables and now takes in stray humans? What perverse fetish is this? And from such a renowned and dignified figure? How pitiful, how base, how unclean."

The crowd snickers in agreement. 

~bossMirth+=2

- 

->round_3_rival->

->Naberius_Battle

=round_3_rival

{Portrait(Rival)}

{rivalKnownRumours?NumerousVisits:

Your rival takes all the elements of the story that you would have mocked, and turns them into assets. Her jokes are gracious, AND funny, and highlight the spirit of Naberius' goodwill.

~bossMirth--

~rivalBossFavor++

- else:

Pan makes a sad joke about fleas. To think, this is the person you compete with. 

}

->->

=endBattle

{Portrait(Naberius)}

Naberius walks away with his proverbial tail between his legs.

->InsultBattle.endBattle

==Byleth_Battle

{Portrait(Byleth)}
{Byleth_Battle<2:
You wonder if this is a good idea. The cat will be a fierce foe. But! You have a lord to amuse...
}

{->round_1|->round_2|->round_3|->endBattle}

=round_1

{Portrait(Byleth)}

Byleth looks at you, haughty and imperious.

* [Stupid jest.]

{Say(Player)} "Have you heard the joke about the cat and the hairball? Anyone? Nope?"

~bossMirth--

* [{ReqConfidence(100)} Bold lie. (Costs 100 Confidence)]

~confidence-=100

{Say(Player)} "Please, let us not tarry together much longer, your presence lingers on the mind like the aftertaste of old vinegar."

~bossMirth++

* {knownRumours?TouchyTrumpet} [Talk about his trumpet playing.]

{Say(Player)} "I'm sure everyone here knows by now that bringing up Byleth's trumpet playing is a surefire way to get clawed across the face. Pity the old cat can't take a joke. His music certainly can though..."

~bossMirth+=2

- 

->round_1_rival->

->Byleth_Battle

=round_1_rival

{Portrait(Rival)}

{rivalKnownRumours?TouchyTrumpet:

{Say(Rival)} "What's this, Byleth gets touchy when you talk about his trumpet?"

You rival winks at the crowd, and embarks on one of the lewdest, wildest jokes you ever heard. By the end of it even Byleth is laughing.

~bossMirth--

~rivalBossFavor++

- else:

Your rival's joke veers dangerously close to the brink of silliness, and then teeters abruptly over the edge of absurdity. You flinch in sympathy.

}

->->

=round_2

{Portrait(Byleth)}

The cat harrumphs and shakes himself. Maybe you've gotten under his skin, despite it all?

* [Stupid jest.]

Make some asinine jest about cat litter. I mean really even you are embarrassed, he only looks like a cat.

~bossMirth--

* [{ReqConfidence(100)} Bold lie. (Costs 100 Confidence)]

~confidence-=100

{Say(Player)} "Thou hast the complexion of cream; as pale as a loon, and somewhat curdled."

~bossMirth++

* {knownRumours?SheetMusic} [Talk about sheet music.]

{Say(Player)} "Numerous little birds have told me that Byleth was recently seen reading copious amounts of sheet music. Alas, the little birds couldn't tell me anything further, as Byleth caught and ate every one of them."

~bossMirth+=2

- 

->round_2_rival->

->Byleth_Battle

=round_2_rival

{Portrait(Rival)}

{rivalKnownRumours?SheetMusic:

Your rival turns the subject matter into music, playing the attention of the crowd as though there were strings upon the fiddle of her wit. You're supposed to compete with this?

~bossMirth--

~rivalBossFavor++

- else:

Alas, your rivals riposte is less music to the ears, and more like the yowling of tomcats. Ouch.

}

->->

=round_3

{Portrait(Byleth)}

It looks like the demon has had enough. He is about to leave!

* [Stupid jest.]

{Say(Player)} "Heaven may have a choir of angels, but we have a cacophony of cats! Or...cat. Singular."

~bossMirth--

* [{ReqConfidence(100)} Bold lie. (Costs 100 Confidence)]

~confidence-=100

It is said none can rival you upon the battlefield, for you are ever first at the scene, and then scarcely after the confrontation has begun, you are once again the first to leave!

~bossMirth++

* {knownRumours?MusicLessons} [Talk about Orpheus.]

The rumour mill says that Byleth recently started taking lessons from the famous Orpheus, the bard of the underworld himself! Alas, even such a famous tutor can't compensate for being tone deaf. Poor Byleth, I'm afraid that ship has sailed. Maybe try something more suited to your talents, like terrifying clergymen or chasing mice?

~bossMirth+=2

- 

->round_3_rival->

->Byleth_Battle

=round_3_rival

{Portrait(Rival)}

{rivalKnownRumours?MusicLessons:

Whatever story you spun, she does it better, with far fewer cat puns and far more incisive witticisms. The crowd laps it up like the proverbial cat with the cream. Oh god, you just can't stop can you?

~bossMirth--

~rivalBossFavor++

- else:

Your rivals joke is as tone-deaf as Byleth himself.

}

->->

=endBattle

{Portrait(Byleth)}

Byleth stalks away.

->InsultBattle.endBattle

==MakeHimLaugh

{Say(Buer)} You amuse me, little jester. I am amused. You have made me laugh this day.

+ [You have won the game!]

WIN_GAME()

->END

==OutOfContent

{Say(Buer)} I remain bored, little jester, even after all our guests are gone. How boring.

+ [You have lost the game - you ran out of time to make him laugh!]

LOSE_GAME()

->END

==MakeHimAngry

{Say(Buer)} Enough of your lackluster prattle and useless wit! I will have more entertainment out of eating you than listening to you!

+ [You have lost the game - you managed to make him angry!]

LOSE_GAME()

->END