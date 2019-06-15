require 'test_helper'

class ParticipantsControllerTest < ActionDispatch::IntegrationTest
  fixtures :participants

  test "GET returns only active participants" do
    get "/v1/participants"
    response_body = JSON.parse(@response.body)
    assert_equal 200, status
    assert_equal 1, response_body.length
    assert_equal 'accepted', response_body[0]['status']
  end

  test 'POST creates a participant with pending status' do
    post "/v1/participants", params: { email: "participantmark@testingfake.net",
                                        f_name: "Mark",
                                        l_name: "Donahue",
                                        gender: "male",
                                        phone: "5005550006",
                                        zip: 77450,
                                        current_weight: 165,
                                        height: 11 }
   response_body = JSON.parse(@response.body)
   assert_equal 200, status
   assert_equal 'pending', response_body['status']
  end

  test 'PUT updates a participant to have pending status' do
   put "/v1/participants/99", params: { status: 'accepted' }
   response_body = JSON.parse(@response.body)
   assert_equal 200, status
  end

  test 'PUT returns a 404 for an invalid user id' do
   put "/v1/participants/555", params: { status: 'accepted' }
   assert_equal 404, status
  end

  test 'PUT returns a 400 for an invalid status' do
   put "/v1/participants/99", params: { status: 'wait_list' }
   response_body = JSON.parse(@response.body)
   assert_equal 400, status
  end

end
