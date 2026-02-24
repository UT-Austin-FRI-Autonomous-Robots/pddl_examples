(define (problem maze-world-a)
	(:domain maze-world)
	(:objects cell_1_1 cell_1_2 cell_1_3 cell_2_1 cell_2_2 cell_2_3 cell_3_1 cell_3_2 cell_3_3 - cell bevo - adventurer door_a - door)
	(:init
		(adjacent cell_1_1 cell_1_2)
		(adjacent cell_1_2 cell_1_3)

		(adjacent cell_2_1 cell_2_2)
		(adjacent cell_2_2 cell_2_3)

		(adjacent cell_3_1 cell_3_2)
		(adjacent cell_3_2 cell_3_3)

		(adjacent cell_1_2 cell_1_1)
		(adjacent cell_1_3 cell_1_2)

		(adjacent cell_2_2 cell_2_1)
		(adjacent cell_2_3 cell_2_2)

		(adjacent cell_3_2 cell_3_1)
		(adjacent cell_3_3 cell_3_2)

		(adjacent cell_1_1 cell_2_1)
		(adjacent cell_2_1 cell_3_1)

		(adjacent cell_1_2 cell_2_2)
		(adjacent cell_2_2 cell_3_2)

		(adjacent cell_1_3 cell_2_3)
		(adjacent cell_2_3 cell_3_3)

		(adjacent cell_2_1 cell_1_1)
		(adjacent cell_3_1 cell_2_1)

		(adjacent cell_2_2 cell_1_2)
		(adjacent cell_3_2 cell_2_2)

		(adjacent cell_2_3 cell_1_3)
		(adjacent cell_3_3 cell_2_3)

		(has-wall cell_2_1)
		(has-wall cell_2_3)
		(has-door cell_2_2)
		(door-in-cell cell_2_2 door_a)

		(in-cell bevo cell_3_1)

	)
	(:goal
		(and
			(in-cell bevo cell_1_1)
		)
	)
)
