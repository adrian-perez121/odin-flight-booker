# Thoughts

## Initial Thoughts

Nest forms don't seem to be as confusing as the many-to-many associations but you never
know until you get into it. So...let's get into it!

## Final Thoughts

Oh my gosh, this project was so much harder than I anticipated. Let's see where all the hardships began.

I would say my first hardship was the search form. Creating the form itself wasn't too difficult but figuring
out a way to get the results was more of a challenge. My final solution was to create different scopes that would be
applied to the model based on which options were selected.

My next challenge was creating the booking model. At first I created the booking model with a flight_id and passenger_id.
I quickly came to realise that the creating a nested form with booking > passenger would be too difficult. Hence, I had
to redo the model so that a passenger had a booking_id instead. From here creating the form wasn't too bad. Just one
really important note to self...MAKE SURE YOU HAVE A CREATE ACTION DEFINE FOR A MODEL

After this form, things went smoothly from here. I have so many more mental notes now with forms and how nested forms work.
Onto the next project!
