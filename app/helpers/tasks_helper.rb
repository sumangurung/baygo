module TasksHelper
  def tasks_with_quadrant
    [
      [ Task.items_in_quadrant_1, '1' ],
      [ Task.items_in_quadrant_2, '2' ],
      [ Task.items_in_quadrant_3, '3' ],
      [ Task.items_in_quadrant_4, '4' ]
    ]
  end
end
