# Code challenge

### Preface
This is a real-world sample of a code challenge our agency commonly  face. We are trying to get a good idea of how you think as a coder and how you collaborate. We value your skill, taste and ability to self direct and do the work over anything else.

### Challenge / Participants Sign in API

Hey Coder!

Pretend I'm one of your fellow team-members at Better. We just got a requirement to add some changes and new features to the API of our health improvement platform.

### Current state / starting point

- This API is built using Rails 5
- This API currently expose only one endpoint
  - `GET` – Lists all the participants existing in our database. This endpoint is available at `v1/participants`
- You can find the source code of this starting point project at the [starting_point](https://github.com/withbetterco/code-challenge/tree/starting_point) branch of this repository.
- In the README file of the [starting_point](https://github.com/withbetterco/code-challenge/tree/starting_point) branch you'll find instructions on how to get the project working locally

### Changes for this challenge

- We need a way to track status of participants.
- Valid statuses for participants are `pending`, `accepted` and `rejected`
- The `GET` endpoint listing participants must return only participant with `accepted` status

### New features for this challenge

- The API should expose two new operations:

  - `POST` – Receive the participant data (`first name`, `last name`, `phone number`, `email`, `Gender`, `Current Weight`, `Height`, `Zip Code`)
  - `PUT` – Updates participant's `status` attribute.
    - This `status` attribute default value is `pending`
    - This `status` attribute may be updated to the following values
      - `accepted` The participant is accepted into our health improvement program.
      - `rejected` The participant is rejected

- Possible errors should be handled appropriately.
- **Bonus points if there's some testing routine coded. (Optional)**
- **Bonus points if you build something fancy on JS attacking our API. (Optional)**


### To send in a submission

Ideally, you can send a pull request to this repository. Remember to use [this branch](https://github.com/withbetterco/code-challenge/tree/starting_point) as an starting point for your changes.

Treat it as an open project, our team will collaborate with you to refine the concepts. If you want to get clarification on a challenge or a specific point open an issue and ask! We'd love to work together to think through this design problem. We can both get a feel for each other in the process.

There is a [Pull Request Template](https://github.com/withbetterco/code-challenge/blob/master/PULL_REQUEST_TEMPLATE.md) in the repo as well.

**Although we prefer a public submission - we understand that could be awkward if you are currently employed. If that's the case you can email your submission to john@withbetter.com - please treat it in the same way, an open design challenge we are collaborating on.**
