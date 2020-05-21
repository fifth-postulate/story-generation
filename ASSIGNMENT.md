# A Bedtime Story Generator
One of the more pleasant trials of being a parent is being called on to act as bedtime story teller. Children want stories that involve themselves or characters they know, aren't scary, but have interesting plots. Parents find themselves cast as writers and storytellers atop the many other skills they’re called on for.

The project will be, in its final form, a small web application that lets parents enter the names of their child's plushies and pets and then generates coherent, customized bedtime stories that make sense using those pets.

Grading will *not* just be on the "code" code. The table of actions is part of the program, and is important too.

Many of you are taking this course as an intro to symbolic AI. This is a very typical sort of symbolic AI task. I've met many AI programmers who have never really learned to make what they contemptuously call "content", much as many software engineers don't know (much) CSS and act like that's OK. Writing good content is a hard skill you really only learn through experience. So as long as we're here, let's learn all the skills, even ones further outside our comfort zone. The "content" is important.

We will use a method, "TALE-SPIN", due to James Meehan[1], that depends on a planner. So in week one we will build a planner. In week two we'll use the planner to build a story generator. In week 3 we'll make the story generator be customizable and give it a web interface.

## Story Generator
Let's turn your planner into a story generator. We'll use the TALESPIN method.

Basic plot writing books say "give your character a goal, and then put difficulties in their way and show them overcoming them".

That's actually a decent algorithm for making a story.
Make a plan
Execute the plan. At each step have a random chance something will go wrong
After the thing goes wrong, make a new plan
go to step 2

We can get a very boring story simply by running the planner - Sally goes on vacation and comes back.

Now, if a hurricane prevents the plane from flying back, we have the start of a story.

Talespin incorporates a simulator that can 'execute' plans.

For some actions, we code up "events" that might happen instead of the normal outcome. The simulator occasionally choose one of these events instead of the normal outcome.

You'll need to tie the event to an action (good reason to give actions atom names), and give it a probability, and a different Add and Remove, and a different description.

Using our vacation example, when Sally tries to fly home, there's a hurricane. Instead of ending up at home, the flight diverts to romantic_city. Sally ends up in romantic_city, and now has to find a way home
.
We assign a probability that this event will happen whenever we apply this action. So maybe there's 10% chance of the hurricane. Note that you're making a story, don't use realistic values. Most of us get on planes and get where we're going.

If the event occurs, we now are NOT in the state we expected to be. Sally is in romantic_city instead of home.

But Sally still wants to go home (goal is unchanged), so we discard our plan and replan - using the current conditions as our new initial conditions.
And we run the simulator on this new plan, continuing our story until we reach our goal.

Perhaps Sally, rather than immediately getting out of romantic_city, encounters romantic_stranger as a result of another event. She might, in a moment of romantic comedy madness, change her goal from get_home to marry_romantic_stranger.

If you've taken my advice about representing goals, you don't need additional engine code to handle this.  Just remove the original goal if appropriate, and add new goal as conditions.

Sally might still need to return home, and we'd leave getting home as a goal. That might be in conflict with being in Paris with Joubert, and give Sally some adventures resolving the conflict. But if Sally's event is that the plane is crashing, her goal is probably to get off the plane alive, no matter where. Getting home is no longer part of the story.

For this week, your story generator should spit out a series of coherent stories at random.

A bit of interesting history - Tale-Spin was originally developed, as I understand it, by a Boeing employee looking for traps of the "this happened, so the crew did that, which actually made things worse" variety.

## The web page
This week we'll convert our command line storyteller to a web application, using SWI-Prolog's web framework.

Expand your storyteller to be more generic. Allow the protagonist to be named anything. Have a number of available animals. Allow the parent to, pick a generic small-inoffensive-mammel-sort-of-critter and then enter Mr. Flopsy.

Consider using a DCG to expand your messages.

Now turn your story generator into a small web application. Have a home page that orients the parent-user, a page that generates stories, etc.

Many of the stories will be nonsensical or boring. Add a tool for the parent to 'keep' the good ones while browsing, and download or print them out at the end.

You don't need to establish accounts, have login, etc., but you do need to keep session data. Your web application should work with multiple users and do something reasonable with page reloads.

Javascript, if used, should be kept to a minimum.

## Advice on making actions and events
Prolog has a long association with natural language processing and AI. Sometimes writing 'content' for an AI system (for us, the actions and events) is closer to liberal arts than the sciences. That too is characteristic of AI.

So here's some more 'literary' advice.

Only show the interesting action. If the door's not interesting to the story, don't make the bear have to turn the knob, open the door, step through, etc.

Pick characters that can interact, and are useful. A teddy bear can stand in for a tiger. An octopus is immediately restricted - it has 8 arms, lives under the sea, etc.

Pick your actions to have events that can later be recovered from in clever ways.

Conflict is the soul of drama. It's as important to know how they'll get out of trouble as well as in.

Pick actions that fit well with the reasoning tool you have. Things that can be drawn as ball and arrow graphs work well.

Give your characters an inner life. Make the teddy bear mad, the bunny sorry, papa bear angry, baby bear frightened.

Watch your scope carefully.  If you find yourself doing more keying than is comfortable, stop and back out. Also, accept that you're probably not a professional writer, and don't feel obligated to be perfect. Do enough to get a feel for it and generate a few stories.

Your first few runs will probably all look boringly similar. Figure out why and adjust - might be as simple as changing the percentages.

You might feel you're 'cheating' by inserting an obvious subplot to be used together. It's OK to cheat in this way. Templated stories are going to be part of it.

While you shouldn't plagerize, you can steal. Pooh's head is stuck in the honey, your human character's hand is stuck in the jar.

This part of the task doesn't have a right answer, only better and worse ones.
