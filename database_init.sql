CREATE TABLE questions (
    id INT PRIMARY KEY,
    group_id INT NOT NULL,
    title text NOT NULL,
    content text NOT NULL
);

INSERT INTO questions VALUES
    (1, 1, 'Plan-The-Course', 'The theme is having a course of action to follow*. People of this style focus on ' ||
                              'knowing what to do and keeping themselves, the group, or the project on track. They ' ||
                              'prefer to enter a situation having an idea of what is to happen. They identify a ' ||
                              'process to accomplish a goal and have a somewhat contained tension as they work to ' ||
                              'create and monitor a plan. The aim is not the plan itself, but to use it as a guide ' ||
                              'to move things along toward the goal. Their informed and deliberate decisions are ' ||
                              'based on analyzing, outlining, conceptualizing or foreseeing what needs to be done.'),
    (2, 1, 'Plan-The-Course', 'The theme is having a course of action to follow*. People of ' ||
                               'this style focus on knowing what to do and keeping themselves, ' ||
                               'the group, or the project on track. They prefer to enter a ' ||
                               'situation having an idea of what is to happen. They identify a ' ||
                               'process to accomplish a goal and have a somewhat contained ' ||
                               'tension as they work to create and monitor a plan. The aim is ' ||
                               'not the plan itself, but to use it as a guide to move things ' ||
                               'along toward the goal. Their informed and deliberate decisions ' ||
                               'are based on analyzing, outlining, conceptualizing or foreseeing ' ||
                               'what needs to be done.')
-- todo: add the rest of the questions
