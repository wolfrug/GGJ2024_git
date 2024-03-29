VAR flyApproval = 0

VAR snakeApproval = 0

VAR rivalApproval = 0

==CorrectBetEncounters

// These encounters happen if you 'bet correctly' and got a bonus room cleared. Just a little flavour. All tunnels.

{~While you are at it, it might be worth taking a look over here...|You didn't hear it from me, but this section is more likely to bear fruit than others.|Word on the grapevine says that you should focus you efforts in certain directions.|This section of the party is looking particularly interesting, better investigate.}

{~->Marchosias_Correct_Encounter->|->Naberius_Correct_Encounter->|->Barfly_Correct_Encounter->|->Rival_Correct_Encounter->|->Dracula_Correct_Encounter->|->Asteroth_Correct_Encounter->|->Byleth_Correct_Encounter->}

->->

=Marchosias_Correct_Encounter

{Portrait(Marchosias)}

//

->->

=Naberius_Correct_Encounter

{Portrait(Naberius)}

->->

=Barfly_Correct_Encounter

{Portrait(Barfly)}

->->

=Rival_Correct_Encounter

{Say(Rival)}

->->

=Dracula_Correct_Encounter

{Portrait(Dracula)}

->->

=Asteroth_Correct_Encounter

{Portrait(Astaroth)}

->->

=Byleth_Correct_Encounter

{Portrait(Byleth)}

->->

==Barfly_Encounters(fromEndOfBattle)

// These encounters happen between rounds with the barfly, just for flavour

{Background("Bar", "The Bar Is In Hell")}

{fromEndOfBattle: You decide to step by the bar before starting.|You abscond to the bar to catch your breath.} The barfly regards you with a thousand faceted eyes.

// This list is non-random and not looping currently. Barfly could technically comment on your hunt, your success, whatever, but...

{->Talk1->|->Talk2->|->Talk3->|->Talk4->|->FinalTalk->}

{Say(Player)} Well, it's been fun. Time to get back to it!

->->

=Talk1

//fixed portrait errors, hopefully

All that talking has made you thirsty. You gesture to the Barfly for a drink.

*["One of your finest glasses of water please!"]

{Portrait(Barfly)}The Barfly's sensory ganglions twitch in surprise. 

{Say(Barfly)} "You aren't a drinker?"

{Say(Player)}You level a wink at him. "I never drink on the job."

{Say(Barfly)} "Hmm, come to think of it I've never seen an off-duty Jester."

{Say(Player)} "Yes, this job does demand most of one's time."

 "Alas it's been 263 years since my last holiday. But what can you do, right? Hell isn't known for it's enlightened employment practices.

{Say(Barfly)} "You can say that again."

*["Give me something strong."] 

{Portrait(Barfly)}The Bar-fly shakes his head, lights refracting from his eyes like the surface of a grungy disco ball.

{Say(Barfly)} "Hard liquor is reserved exclusively for the guests, by order of the Host."

**"Typical."

{Portrait(Player)}You feel a sudden burning sensation on the back of your neck and sneak a glance over your shoulder to make sure Lord Buel hasn't snuck up behind you. 

He's suprisingly stealthy for a giant terrifying lion head surrounded by eldritch wings - but thankfully (this time) he is nowhere to be seen.

-   **[The Bar-Fly hands you a murky glass of water.]

        ***[Gaze mournfully into the glass] You raise the glass to the neon light of the bar sign and gaze mournfully into its depths.

{Say(Player)} "This water is opaque. In fact it's practically a solid. Where did you get it, Ankh-Morpokh?"

        ***[Take a swig of water.]

{Say(Player)} "It's been several centuries since I last tasted proper liquor, but if I close my eyes I can almost rem--- ack. Ugh. Oh god. What is this, bilge water?!"

--{Portrait(Barfly)} The Bar-Fly looks at you. Looks at the glass. Looks back at you. And shrugs.

{Say(Player)} "Right, gotcha. It's better not to ask."

->->

=Talk2

You return to the bar, a little wearier, a little wiser. 

*[Greet your Nemesis.]

You spot her a few stools down, nursing something bright and poisonous looking in a tall martini glass. No bilge water for Miss Pandemonium. No sir. 

{Say(Player)}"Fancy meeting you here."

{Say(Rival)}"Yes well, just think of it as an unfortunate accident. Like a car crash or a heart attack."

{Say(Player)}"You do like to spring up out of nowhere."

{Say(Rival)}"Please, I think you'll find that I was here first."

{Say(Barfly)}"AHEM." The Barfly levels you with a look - or does he? It's really quite hard to tell, and resumes wiping the bar with a dirty rag.

Both you and Pandemonium get the hint, and lower your heads like chastised children. No arguing at the Bar, got it.

**"Guess I'll see you later then?"

{Say(Rival)} Pan smirks, and downs the rest of her drink. 

"Indeed. And put in some effort this time will you, it's MEANT to be a competition."

->->

=Talk3

You are taking a break by the bar when you notice a suspicious figure lurking nearby.

* [Signal them over.]

~snakeApproval++

{Portrait(Marchosias)}

 The representative for Serpent House wags his serpentine tail and joins you at the bar.  

 It quickly becomes clear that Serpent House wishes to make an alliance. Their envoy isn't much of a negotiator, but what he lacks in acumen he makes up for with fluffiness. 

{Portrait(Marchosias)} "So what do you say? Are you willing to turn a blind eye here and elevate us in Lord Buer's favour?"

** [Sure!] After all why not. Why shouldn't you say yes to this nice fluffy demon. It's not like it will hurt anyone. 

 You catch sight of the look in Marchosias serpentine half's eyes, and try to resist the urge to pat him on his head. 

~snakeApproval++

** [Perhaps...for a price.] "I know I appear to be little more than a Motley Fool, but I know my own worth. Sweeten the deal a little and I'll...consider it."

What do you really owe your lord anyway? He doesn't even let you take any holidays.

Marchosias seems a bit ruffled, but he hands over a bribe as requested. You feel a boost of confidence wash over you. 

Mmm, delicious.

~confidence+= 50 

~snakeApproval++

** [Reject the offer.] He's awfully eager, so you try to let him down gently. You give him a lot of spiel about company loyalty, fearing for you life, and besmirching the honour of jesters. He laps it all up.

   {Portrait(Marchosias)} "Say no more. I understand completely." 

    Marchosias leaves the bar, ears flattened with dejection. Pity, he seemed like such a good boy. You hope Asteroth won't treat his failure too badly.

* [{ReqConfidence(50)} Ignore this nonsense.]

~confidence-= 50 

"I'm not in the market today for any snake-oil salesman spiel,.Please move along."

You are awfully busy and important after all. Can't they tell just from looking at you?

For whatever reason, this tactic seems to work, and the figure depart looking a little non-plussed.

~snakeApproval--

- 

->->

=Talk4

Ah, at last sweet rest.

The Barfly approaches and silently hands over a glass of "water".

{Say(Barfly)} "I noticed that Serpent House representative lurking around last time. Perhaps you'd also be willing to hear out a humble fly?"

* [Accept his offer]

~flyApproval++

You have the time, so why not. The Barfly sidles closer, leaning his imposing bulk upon the bar.

  

He is clearly experienced when it comes to coercion. Before you know it you are halfway through a deal to become a secret double agent for the Order of Flies. 

You tear your gaze away from the wall of glittering black before you. What is this, hypnotism?

{Say(Barfly)} "So what'll it be? Are you with us... or against us?"

** [Yes.] Somehow you get the feeling that saying no to his offer would be an all-round bad idea. You flash a sickly smile and shake his clasped antennae to seal the deal. 

~flyApproval++

** [{ReqConfidence(50)} Sure, for a price.] 

You must have nerves of steel to be asking a demon like this for a bribe - that or you really are a fool. 

But when you make your proposal the Barfly merely regards you for one glittering, lengthy moment, then rubs his forelegs together with a satisfied smile.

As he hands the items to you under the counter you feel a surge of Confidence, as though you've just narrowly avoided death.

~confidence+=150

~flyApproval++

** [Reject the offer.] You feel like you're making a terrible mistake. But principles are principles, and a decision is a decision, and whether you're principled or decisive you're going to have to live with the consequences now.

~flyApproval++

* [{ReqConfidence(50)} Turn him down flatly.]

~confidence-=50 

He may have the buzz on all the latest happenings, but you are far too much on your plate as is. You tell him to buzz off - but politely.

~flyApproval--

* [{ReqSnakeApproval(2)} Reject the offer]  You've already chosen a serpent for this particular race.

~snakeApproval++

- 

->->

=FinalTalk

//DEBUG: Move this talk up in the list and leave it as the final one if no other talks are forthcoming.

You take a moment to catch your breath.

->->

