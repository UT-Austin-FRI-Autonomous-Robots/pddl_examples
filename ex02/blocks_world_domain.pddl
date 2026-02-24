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
		:parameters (?g - gripper ?b - block ?c - block)
		:precondition (and
			(clear ?b)
			(empty ?g)
			(stacked ?b ?c)
		)
		:effect (and
			(not (stacked ?b ?c))
			(in-gripper ?b ?g)
			(clear ?c)
			)
	)
	(:action stack
		:parameters (?g - gripper ?b - block ?c - block)
		:precondition (and
			(in-gripper ?b ?g)
			(clear ?c)
		)
		:effect (and
			(stacked ?b ?c)
			(not (clear ?c))
			(not (in-gripper ?b ?g))
			)
	)
	(:action grab-from-table
		:parameters (?g - gripper ?b - block ?c - table)
		:precondition (and
			(clear ?b)
			(empty ?g)
			(on-table ?b ?c)
		)
		:effect (and
			(not (on-table ?b ?c))
			(in-gripper ?b ?g)
			)
	)
	(:action place-on-table
		:parameters (?g - gripper ?b - block ?t - table)
		:precondition (and
			(in-gripper ?b ?g)
    	)
		:effect (and
			(on-table ?b ?t)
			(clear ?b)
			(empty ?g)
			(not (in-gripper ?b ?g))
		)
	)	
)
