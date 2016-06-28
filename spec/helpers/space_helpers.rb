module SpaceHelper

  def create_space
    Space.create(name: "YoMama House",
      description: "a really dirty house",
      price_per_night: 20.00,
      user_id: 1)
  end
end
