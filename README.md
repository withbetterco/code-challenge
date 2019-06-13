# Code challenge

### Preface
This is a real-world sample of a code challenge our agency commonly  face. We are trying to get a good idea of how you think as a coder and how you collaborate. We value your skill, taste and ability to self direct and do the work over anything else.

### Challenge / Participants Sign in API

Hey Coder!

Pretend I'm one of your fellow team-members at Better. We need to build an API for our health improvement platform. This API will allow potential participants to sign up and join our program.

- The API should expose three different operations through
a single endpoint:

  - `POST` – Receive the participant data (`first name`, `last name`, `phone number`, `email`, `Gender`, `Current Weight`, `Height`, `Zip Code`)
  - `PUT` – Updates participant's `status` attribute.
    - This `status` attribute default value is `pending`
    - This `status` attribue may be updated to the follwoing values
      - `accepted` The participant is accepted into our health improvement program.
      - `rejected` The participant is rejected
  - `GET` – List the participants with `accepted` status and their respective data.

- Possible errors should be handled appropriately.
- The simulated data store, containing the participants, statuses,
signing up data and complementary data should be
designed and implemented by the candidates.
- **Bonus points if there's some testing routine coded. (Optional)**
- **Bonus points if you build something fancy on JS attacking our API. (Optional)**


### To send in a submission

Ideally, you can send a pull request to this repository. Treat it as an open project, our team will collaborate with you to refine the concepts. If you want to get clarification on a challenge or a specific point open an issue and ask! We'd love to work together to think through this design problem. We can both get a feel for each other in the process.

There is a [Pull Request Template](https://github.com/withbetterco/design-challenge/issues/1) in the repo as well.

**Although we prefer a public submission - we understand that could be awkward if you are currently employed. If that's the case you can email your submission to john@withbetter.com - please treat it in the same way, an open design challenge we are collaborating on.**
