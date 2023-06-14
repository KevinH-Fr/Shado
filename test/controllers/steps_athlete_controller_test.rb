require "test_helper"

class StepsAthleteControllerTest < ActionDispatch::IntegrationTest
  test "should get step1" do
    get steps_athlete_step1_url
    assert_response :success
  end

  test "should get step2" do
    get steps_athlete_step2_url
    assert_response :success
  end

  test "should get step3" do
    get steps_athlete_step3_url
    assert_response :success
  end
end
