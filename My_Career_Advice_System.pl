% Defined careers with associated skills, interests, and descriptions
career(doctor,
       [medicine, biology, chemistry, empathy, problem_solving, decision_making, patience],
       [helping_others, research, teamwork, critical_thinking, compassion, adaptability, communication],
       'Doctors diagnose and treat medical conditions, focusing on patient care and health improvement. They require a strong background in medicine, biology, and empathy to effectively communicate and solve complex problems in a fast-paced environment.').

career(teacher,
       [education, communication, patience, organization, adaptability, leadership, creativity],
       [working_with_children, public_speaking, mentoring, critical_thinking, empathy, problem_solving, innovation],
       'Teachers educate and mentor students, requiring strong communication and organizational skills. They work with children, promote critical thinking, and foster creativity to ensure effective learning experiences.').

career(engineer,
       [math, physics, problem_solving, creativity, analytical_thinking, programming, design],
       [design, building_things, innovation, problem_solving, technology, teamwork, critical_thinking],
       'Engineers design and build innovative solutions using mathematics, programming, and problem-solving skills. They collaborate in teams to create technological advancements and solve complex problems.').

career(artist,
       [creativity, imagination, self_expression, adaptability, originality, attention_to_detail, problem_solving],
       [creating_art, self_employment, storytelling, innovation, critical_thinking, communication, aesthetics],
       'Artists express themselves through various mediums, requiring creativity, originality, and attention to detail. They innovate and communicate stories or emotions through their art.').

career(programmer,
       [problem_solving, logic, programming_languages, attention_to_detail, debugging, software_development, analytical_thinking],
       [technology, coding, analysis, problem_solving, innovation, creativity, logic],
       'Programmers develop software, focusing on problem-solving, logic, and coding expertise. They analyze and innovate in software development, ensuring efficient and functional solutions.').

career(writer,
       [creativity, language_skills, storytelling, research, editing, literature, communication],
       [writing, imagination, communication, critical_thinking, empathy, problem_solving, storytelling],
       'Writers create stories and content using language skills, imagination, and research abilities. They communicate ideas effectively through various forms of writing.').

career(nurse,
       [medical_knowledge, empathy, attention_to_detail, adaptability, stress_management, patient_care, critical_thinking],
       [teamwork, critical_thinking, compassion, communication, problem_solving, innovation, adaptability],
       'Nurses provide patient care, requiring medical knowledge, empathy, and attention to detail. They collaborate in teams, demonstrate compassion, and solve problems in a dynamic healthcare environment.').

career(architect,
       [design, math, creativity, attention_to_detail, visualization, project_management, problem_solving],
       [building_design, problem_solving, aesthetics, creativity, innovation, communication, critical_thinking],
       'Architects design buildings, utilizing math, creativity, and attention to detail. They manage projects, focus on aesthetics, and solve complex problems in architectural design.').

career(chef,
       [culinary_skills, creativity, organization, time_management, menu_planning, taste_sensitivity, problem_solving],
       [cooking, menu_planning, gastronomy, creativity, problem_solving, innovation, organization],
       'Chefs create culinary masterpieces, demonstrating creativity, organization, and culinary skills. They innovate in menu planning and solve challenges in the kitchen.').

career(scientist,
       [research, analysis, critical_thinking, curiosity, experimentation, data_interpretation, problem_solving],
       [experimentation, discovery, scientific_method, critical_thinking, innovation, problem_solving, research],
       'Scientists conduct research and experiments, requiring analytical skills, critical thinking, and a curiosity for discovery. They interpret data and innovate using the scientific method.').

career(designer,
       [creativity, problem_solving, aesthetics, technology, visual_communication, user_experience, innovation],
       [graphic_design, user_experience, innovation, problem_solving, creativity, aesthetics, technology],
       'Designers focus on creativity, aesthetics, and problem-solving to create visually appealing and user-friendly designs. They innovate in graphic design and user experience.').

% Get the user's skills and interests
user_input(Skills, Interests) :-
    writeln('Enter your skills (comma-separated): '),
    readln(Skills),
    writeln('Enter your interests (comma-separated): '),
    readln(Interests).

% Check if there is a partial match between two lists
partial_match(List1, List2) :-
    intersection(List1, List2, Intersection),
    length(Intersection, Len),
    Len >= 4. % Check if at least 4 out of 7 skills/interests match

% Find suitable careers for the user based on partial matching
suitable_careers(Skills, Interests, SuitableCareers) :-
    findall(Career-Description, (
        career(Career, RequiredSkills, CareerInterests, Description),
        partial_match(Skills, RequiredSkills),
        partial_match(Interests, CareerInterests)
    ), SuitableCareers).

% Display the suitable careers along with descriptions
display_careers([]) :-
    writeln('Sorry, no suitable careers found for your skills and interests.').
display_careers(SuitableCareers) :-
    writeln('Suitable careers for you:'),
    display_career_details(SuitableCareers).

display_career_details([]).
display_career_details([Career-Description|Rest]) :-
    format('~w: ~n~w~n~n', [Career, Description]),
    display_career_details(Rest).

% Entry point to the program
career_advice :-
    writeln('Welcome to the career advice program!'),
    user_input(Skills, Interests),
    suitable_careers(Skills, Interests, SuitableCareers),
    display_careers(SuitableCareers).















