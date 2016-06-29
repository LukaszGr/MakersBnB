#Makers BnB

We would like a web application that allows users to list spaces they have available, and to hire spaces for the night.

## Headline Specifications

- Any signed-up user can list a new space.
- Users can list multiple spaces.
- Users should be able to name their space, provide a short description of the space, and a price per night.
- Users should be able to offer a range of dates where their space is available.
- Any signed-up user can request to hire any space for one night, and this should be approved by the user that owns that space.
- Nights for which a space has already been booked should not be available for users to book that space.
- Until a user has confirmed a booking request, that space can still be booked for that night.

## Nice to have Specifications

- Users should receive an email whenever one of the following happens:
- They sign up
- They create a space
- They update a space
- A user requests to book their space
- They confirm a request
- They request to book a space
- Their request to book a space is confirmed
- Their request to book a space is denied
- Users should receive a text message to a provided number whenever one of the following happens:
- A user requests to book their space
- Their request to book a space is confirmed
- Their request to book a space is denied
- A ‘chat’ functionality once a space has been booked, allowing users whose space-booking request has been confirmed to chat with the user that owns that space
- Basic payment implementation though Stripe.

---PENDING---

```
As the owner of a listing
So I can hire out my listing
I want to approve the request from a signed-in user
```

```
As a owner of a listing
So I can choose who rents my listing
I want to see all booking requests
```

```
As a signed-up user
So I can only view available spaces
I want to only see listings that have not already been confirmed as booked
```

---DONE---

```
As a signed-up user
So I can hire a space
I want to hire a space for one night
```

```
As a user
So I can list a space
I want to be able to sign up
```

```
As a signed-up user
So I can make some money
I want to list a space with a name, description and a price per night
```

```
As a signed-up user
So I can make more money
I want to list multiple spaces
```

```
As a user
So I can see all spaces
I want to see all listings
```

```
As a signed-up user
So I can offer my listing at the appropriate dates
I can select a range of dates it is available
```
