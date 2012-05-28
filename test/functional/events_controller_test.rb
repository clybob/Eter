require 'test_helper'

class EventsControllerTest < ActionController::TestCase
  setup do
    @event = events(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:events)
    assert_index_tags 10, 6
    assert_paginate_is_displayed
  end

  test "should get index paginated" do
    get( :index, { 'page' => '2' }  )
    assert_response :success
    assert_not_nil assigns(:events)
    assert_index_tags 1, 6
    assert_paginate_is_displayed
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create event" do
    assert_difference('Event.count') do
      post :create, event: @event.attributes
    end

    assert_redirected_to event_path(assigns(:event))
  end

  test "should not create event with invalid data" do
    @new_event = Event.new(name: "", editorial_id: 1, points: "A")
    assert_equal @new_event.save, false
  end

  test "should show event" do
    get :show, id: @event
    assert_show_tag_p(4)
    assert_select ".span12", /#{@event.name}/
    assert_select ".span12", /#{@event.points}/
    assert_select ".span12", /#{@event.editorial.uri}/
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @event
    assert_response :success
  end

  test "should edit name of event" do
    @event.name = "Evento"
    @event.save!
    assert_equal(@event.name, "Evento")
  end

  test "should edit with invalid data" do
    @event.name = ""
    @event.points = "S"
    assert_equal @event.save, false
  end

  test "should update event" do
    put :update, id: @event, event: @event.attributes
    assert_redirected_to event_path(assigns(:event))
  end

  test "should destroy event" do
    assert_difference('Event.count', -1) do
      delete :destroy, id: @event
    end

    assert_redirected_to events_path
  end
end
