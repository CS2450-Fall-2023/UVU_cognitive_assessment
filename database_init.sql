DROP TABLE IF EXISTS questions;
DROP TABLE IF EXISTS form_answers;
CREATE TABLE questions (
    id INT PRIMARY KEY,
    group_id INT NOT NULL,
    next_group_id INT NOT NULL,
    title text NOT NULL,
    content text NOT NULL
);

CREATE TABLE form_answers (
	id SERIAL PRIMARY KEY,
    first_name text NOT NULL,
    last_name text NOT NULL,
    cognitive_function text NOT NULL,
    favorite_color text NOT NULL
);

INSERT INTO questions VALUES
    (1, 1, 2 , 'Plan-The-Course', 'The theme is having a course of action to follow. People of this style focus on ' ||
                              'knowing what to do and keeping themselves, the group, or the project on track. They ' ||
                              'prefer to enter a situation having an idea of what is to happen. They identify a ' ||
                              'process to accomplish a goal and have a somewhat contained tension as they work to ' ||
                              'create and monitor a plan. The aim is not the plan itself, but to use it as a guide ' ||
                              'to move things along toward the goal. Their informed and deliberate decisions are ' ||
                              'based on analyzing, outlining, conceptualizing or foreseeing what needs to be done.'),
    (2, 1, 3, 'Behind-The-Scenes', 'People of this style focus on understanding and working with the process to create ' ||
                                'a positive outcome. They see value in many contributions and consult outside' ||
                                ' inputs to make an informed decision. They aim to integrate various information' ||
                                ' sources and accommodate differing points of view. They approach others with a' ||
                                ' quiet, calm style that may not show their strong convictions. Producing,' ||
                                ' sustaining, defining, and clarifying are all ways they support a group''s process.' ||
                                ' They typically have more patience than most with the time it takes to gain support' ||
                                ' through consensus for a project or to refine the result.'),
    (3, 1, 4, 'In-Charge', 'People of this style are focussed on results, often taking action quickly. They often have ' ||
                        'a driving energy with an intention to lead a group to the goal. They make ' ||
                        'decisions quickly to keep themselves and others on task, on target, and on time. ' ||
                        'They hate wasting time and having to back track. Mentoring, executing actions, ' ||
                        'supervising, and mobilizing resources are all ways they get things accomplished. ' ||
                        'They notice right away what is not working in a situation and become painfully ' ||
                        'aware of what needs to be fixed, healed, or corrected.'),
    (4, 1, 5, 'Get-Things-Going', 'They thrive in facilitator or catalyst roles and aim to inspire others to move to ' ||
                               'action, facilitating the process. Their focus is on interaction, often with an ' ||
                               'expressive style. They Get-Things-Going with upbeat energy, enthusiasm, or ' ||
                               'excitement, which can be contagious. Exploring options and possibilities, making ' ||
                               'preparations, discovering new ideas, and sharing insights are all ways they get ' ||
                               'people moving along. They want decisions to be participative and enthusiastic, with ' ||
                               'everyone involved and engaged.'),
    (5, 2, 0, 'Foreseer Developer', 'Personal growth. Sustain the vision. Honoring the gifts of others. Taking a ' ||
                                 'creative approach to life. Talent for foreseeing. Exploring issues. Bridge ' ||
                                 'differences and connect people. Practical problem solving. Live with a sense of ' ||
                                 'purpose. Living an idealistic life often presents them with a great deal of ' ||
                                 'stress and a need to withdraw.'),
    (6, 2, 0, 'Planner Inspector', 'Drawing up plans and being prepared. Take responsibility. Getting work done first. ' ||
                                'Being active in the community. Loyalty to their roles. Cultivating good qualities. ' ||
                                'Doing the right thing. Bear life''s burdens and overcome adversity. Talented at ' ||
                                'planning, sequencing, and noticing what''s missing. Having to learn so much in ' ||
                                'hindsight is painful at times.'),
    (7, 2, 0, 'Conceptual Director', 'Maximizing achievements. Drive for self-mastery. Build a vision. Very long-range ' ||
                                  'strategizing. Realizing progress toward goals. Systems thinking. Talent for ' ||
                                  'seeing the reasons behind things. Being on the leading edge. Maintaining ' ||
                                  'independence. Find it difficult to let go in interacting with others.'),
    (8, 2, 0, 'Analyzer Operator', 'Actively solving problems. Observing how things work. Talent for using tools for ' ||
                                'the best approach. Need to be independent. Act on their hunches or intuitions. ' ||
                                'Understanding a situation. Taking things apart. Making discoveries. Sharing those ' ||
                                'discoveries. Unsettled by powerful emotional experiences.'),
    (9, 3, 0, 'Harmonizer Clarifier', 'Going with the flow. Knowing what is behind what is said. Uncovering mysteries. ' ||
                                   'Exploring moral questions. Talent for facilitative listening. Relate through ' ||
                                   'stories and metaphors. Balancing opposites. Getting reacquainted with ' ||
                                   'themselves. Have a way of knowing what is believable. Struggling with structure ' ||
                                   'and getting their lives in order.'),
    (10, 3, 0,'Protector Supporter', 'Noticing what''s needed and what''s valuable. Talent for careful and supportive ' ||
                                   'organization. Know the ins and outs. Enjoy traditions. Work to protect the ' ||
                                   'future. Listening and remembering. Being nice and agreeable. Unselfish ' ||
                                   'willingness to volunteer. Feeling a sense of accomplishment. Exasperated when ' ||
                                   'people ignore rules and don''t get along.'),
    (11, 3, 0, 'Designer Theorizer', 'Becoming an expert. Seeing new patterns and elegant connections. Talent for ' ||
                                  'design and redesign. Crossing the artificial boundaries of thought. Activate the ' ||
                                  'imagination. Clarifying and defining. Making discoveries. Reflect on the process ' ||
                                  'of thinking itself. Detach to analyze. Struggle with attending to the physical ' ||
                                  'world.'),
    (12, 3, 0, 'Composer Producer', 'Taking advantage of opportunities. Stick with what''s important. Talent for ' ||
                                 'pulling together what is just right. Creative problem solving Building ' ||
                                 'relationships. Attracting the loyalties of others. Being their own true self. ' ||
                                 'Have their own personal style. Play against expectations. Struggle with nurturing ' ||
                                 'their own self-esteem.'),
    (13, 4, 0, 'Envisioner Mentor', 'Communicate and share values. Succeeding at relationships. Realizing dreams-their ' ||
                                 'own and others. Seek opportunities to grow together. Heeding the call to a life ' ||
                                 'work or mission. Enjoy the creative process. Intuitive intellect. Reconcile the ' ||
                                 'past and the future. Talent for seeing potential in others. Often find living in ' ||
                                 'the present difficult.'),
    (14, 4, 0, 'Implementor Supervisor', 'Talent for bringing order to chaotic situations. Educating themselves. ' ||
                                      'Industrious, work-hard attitude. Balance work with play. Having a philosophy ' ||
                                      'of life. Having the steps to success. Keeping up traditions Being well ' ||
                                      'balanced. Connecting their wealth of life experiences. Often disappointed ' ||
                                      'when perfectionistic standards for economy and quality are not met.'),
    (15, 4, 0, 'Strategist Mobilizer', 'Being a leader. Maximize talents. Marshal resources toward progress. Intuitive ' ||
                                    'explorations. Forging partnerships. Mentoring and empowering. Talent for ' ||
                                    'coordinating multiple projects. Balance peace and conflict. Predictive ' ||
                                    'creativity. Often overwhelmed by managing all the details of time and resources.'),
    (16, 4, 0, 'Promoter Executer', 'Taking charge of situations. Tactical prioritizing. Talent for negotiating. Want ' ||
                                 'a measure of their success. Keep their options open. Enjoy acting as a ' ||
                                 'consultant. Winning people over. Caring for family and friends. Enjoy ' ||
                                 'exhilaration at the edge. Disappointed when others don''t show respect.'),
    (17, 5, 0, 'Discoverer Advocate', 'Inspiring and facilitating others. Exploring perceptions. Talent for seeing ' ||
                                   'what''s not being said and voicing unspoken meanings. Seek to have ideal ' ||
                                   'relationships. Recognize happiness. Living out stories. Want to authentically ' ||
                                   'live with themselves. Respond to insights in the creative process. Finding the ' ||
                                   'magical situation. Restless hunger for discovering their direction.'),
    (18, 5, 0, 'Facilitator Caretaker', 'Accepting and helping others. Managing people. Hearing people out. Voicing ' ||
                                     'concerns and accommodating needs. Admire the success of others. Remember ' ||
                                     'what''s important. Talented at providing others with what they need. Keep ' ||
                                     'things pleasant. Maintaining a sense of continuity. Accounting for the costs. ' ||
                                     'Often disappointed by entrepreneurial projects.'),
    (19, 5, 0, 'Explorer Inventor', 'Being inventive. Talented at building prototypes and getting projects launched. ' ||
                                 'Lifelong learning. Enjoy the creative process. Share their insights about life''s ' ||
                                 'possibilities. Strategically formulate success. An inviting host. Like the drama ' ||
                                 'of the give and take. Trying to be diplomatic. Surprised when their strategizing ' ||
                                 'of relationships becomes problematic.'),
    (20, 5, 0, 'Motivator Presenter', 'Stimulating action. Have a sense of style. Talent for presenting things in a ' ||
                                   'useful way. Natural actors-engaging others. Opening up people to possibilities. ' ||
                                   'Respect for freedom. Taking risks. A love of learning, especially about people ' ||
                                   'Genuine caring. Sometimes misperceive others intentions.');