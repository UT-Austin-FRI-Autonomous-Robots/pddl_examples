(define (domain blocks-world)
	(:requirements :typing)
	(:types block gripper table)
	(:predicates
		(empty ?g - gripper)
		(clear ?b - block)
		(stacked ?a - block ?b - block)
		(on-table ?a - block ?b - table)
		(in-gripper ?b - block ?g - gripper)
	)
	(:action unstack
		:parameters (?g - gripper ?a - block ?b - block)
		:precondition (and
			(clear ?a)
			(empty ?g)
			(stacked ?a ?b)
		)
		:effect (and
			(not (clear ?a))
			(clear ?b)
			(not (empty ?g))
			(in-gripper ?a ?g)
			(not (stacked ?a ?b))
		)
	)

	(:action stack
		:parameters (?g - gripper ?a - block ?b - block)
		:precondition (and
			(in-gripper ?a ?g)
			(clear ?b)
			(not (stacked ?a ?b))
		)
		:effect (and
			(not (clear ?b))
			(clear ?a)
			(empty ?g)
			(not (in-gripper ?a ?g))
			(stacked ?a ?b)
		)
	)


	(:action pick-from-table
		:parameters (?g - gripper ?a - block ?b - table)
		:precondition (and
			(clear ?a)
			(empty ?g)
			(on-table ?a ?b)
		)
		:effect (and
			(not (clear ?a))
			(not (empty ?g))
			(in-gripper ?a ?g)
			(not (on-table ?a ?b))
		)
	)

	(:action place-on-table
		:parameters (?g - gripper ?a - block ?b - table)
		:precondition (and
			(not (clear ?a))
			(not (empty ?g))
			(in-gripper ?a ?g)
			(not (on-table ?a ?b))
		)
		:effect (and
			(clear ?a)
			(empty ?g)
			(not (in-gripper ?a ?g))
			(on-table ?a ?b)
		)
	)
)
