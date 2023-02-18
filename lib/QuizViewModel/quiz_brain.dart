import 'dart:ffi';
import '../question.dart';

class QuizBrain {
  int _questionNumber = 0;

  List<Question> _questionBank = [
    Question('Which material is the best heat conductor', ["Steel", "Diamond", "Lithium", "Copper"], "Diamond"),
    Question('The moon is _% the size of Earth.', ["2%", "18%", "10%", "27%"], "27%"),
    Question('Which gas is responsible for the ripening of fruit?', ["Carbon Monoxide", "Methane", "Ethylene", "Phosphine"], "Ethylene"),
    Question('What is another way of writing "3 x 2 x 1"?', ["3!", "3∑", "3^", "3∫˙"], "3!"),
    Question('Which is a vertebrate?', ["Coral", "Jellyfish", "Eel", "Octopus"], "Eel"),
    Question('The "atomic number" is the number of _ found in every atom of a chemical element.', ["Electrons", "Molecules", "Isotopes", "Protons"], "Protons"),
    Question('Charles Babbage is considered the father of the _.', ["Battery", "Computer", "Chaos Theory", "Periodic Table"], "Computer"),
    Question('In the human body, the pineal gland releases which hormone?', ["Adrenaline", "Melatonin", "Cortisol", "Testosterone"], "Melatonin"),
    Question('A tesseract is a 4-dimensional equivalent of a _.', ["Cube", "Hexagon", "Helix", "Star Polygon"], "Cube"),
    Question('You disagree with an idea being discussed in a group but stay quiet out of conformity. This is called _.', ["Anthropocentric Thinking", "Your Job", "Barnum Effect", "Groupthink"], "Groupthink"),
    Question('What time system has days that last 23 h 56 min 4 s?', ["Binary clock", "Roman", "Ephemeris", "Sideral"], "Sideral"),
    Question('The difference between speed and velocity is that velocity also considers _.', ["Acceleration", "Gravity", "Direction", "Tangent"], "Direction"),
    Question('Which organism has the highest number of chromosomes?', ["Human", "Pidgeon", "Lion", "Strawberry"], "Pidgeon"),
    Question('In geometry, what do you call a point where two or more lines meet?', ["Azimuth", "Tessellation", "Segment", "Vertex"], "Vertex"),
    Question('Anemophily is pollination by _.', ["Wind", "Insects", "Water", "Anemones"], "Wind"),
    Question('What do you call pieces of rock thrown into the air during a volcanic eruption?', ["Tephra", "Lahar", "Magma", "Fumarole"], "Tephra"),
    Question('What term discribes an organism that can survive without oxygen?', ["Allotrope", "Inorganic", "Anaerobic", "Thylakoid"], "Anaerobic"),
    Question('Which physics law is known as the "law of action and reaction?"', ["Newton's First Law", "Newton's Third Law", "Newton's Second Law", "Murphy's Law"], "Newton's Third Law"),
    Question('What does the "N" stand for in DNA?', ["Nucleic", "Nesting", "Neutrino", "Neo-Alkane"], "Nucleic"),
    Question('The ongoing mass extinction event caused by human activity is known as _.', ["Olson's Extinction", "Holocene Extinction", "Mulde Event", "Great Oxygenation Event"], "Holocene Extinction"),
    Question("What is the smallest planet in our solar system?", ["Mars", "Mercury", "Venus", "Pluto"], "Mercury"),
    Question("What is the chemical symbol for the element gold?", ["Au", "G", "Go", "Ag"], "Au"),
    Question("What is the study of earthquakes called?", ["Seismology", "Meteorology", "Astronomy", "Hydrology"], "Seismology"),
    Question("What is the largest organ in the human body?", ["Liver", "Heart", "Skin", "Brain"], "Skin"),
    Question("What is the name of the process by which plants make their own food?", ["Photosynthesis", "Metabolism", "Respiration", "Transpiration"], "Photosynthesis"),
    Question("What is the energy source for most living organisms on Earth?", ["Nuclear energy", "Solar energy", "Wind energy", "Chemical energy from food"], "Chemical energy from food"),
    Question("What is the term for the study of ancient life and fossils?", ["Paleontology", "Anthropology", "Archaeology", "Ethnology"], "Paleontology"),
    Question("What is the study of stars and galaxies called?", ["Astrophysics", "Cosmology", "Astrobiology", "Stellarology"], "Astrophysics"),
    Question("What is the term for the study of insects?", ["Entomology", "Herpetology", "Ichthyology", "Ornithology"], "Entomology"),
    Question("What is the name of the first man to walk on the moon?", ["Neil Armstrong", "Buzz Aldrin", "Michael Collins", "Alan Shepard"], "Neil Armstrong"),
    Question("What is the largest planet in our solar system?", ["Jupiter", "Saturn", "Uranus", "Neptune"], "Jupiter"),
    Question("What is the name of the process by which living organisms produce offspring?", ["Reproduction", "Metamorphosis", "Regeneration", "Evolution"], "Reproduction"),
    Question("What is the term for the study of fossils and ancient life?", ["Paleontology", "Archeology", "Anthropology", "Geology"], "Paleontology"),
    Question("What is the name of the force that keeps objects in orbit around a planet?", ["Gravity", "Lift", "Thrust", "Drag"], "Gravity"),
    Question("What is the name of the first vaccine developed against smallpox?", ["Variolation", "Jennerization", "Pasteurization", "Immunization"], "Jennerization"),
    Question("What is the term for the study of the Earth's crust, structure, and composition?", ["Geology", "Oceanography", "Meteorology", "Seismology"], "Geology"),
    Question("What is the name of the part of the cell that contains genetic information?", ["Mitochondria", "Nucleus", "Ribosome", "Endoplasmic reticulum"], "Nucleus"),
    Question("What is the term for the study of plants?", ["Botany", "Zoology", "Mycology", "Entomology"], "Botany"),
    Question("What is the term for the study of the weather and climate?", ["Meteorology", "Oceanography", "Hydrology", "Seismology"], "Meteorology"),
    Question("What is the name of the unit used to measure an object's weight?", ["Newton", "Joule", "Watt", "Kilogram"], "Newton"),
    Question("What is the term for the study of the structure and function of living organisms?", ["Biology", "Zoology", "Botany", "Microbiology"], "Biology"),
    Question("What is the name of the process by which water evaporates and becomes a gas?", ["Condensation", "Evaporation", "Sublimation", "Melting"], "Evaporation"),
    Question("What is the term for the study of the behavior and mental processes of animals?", ["Ethology", "Herpetology", "Ornithology", "Psychology"], "Ethology"),
    Question("What is the name of the structure that acts as the control center of a cell?", ["Mitochondria", "Nucleus", "Ribosome", "Endoplasmic reticulum"], "Nucleus"),
    Question("What is the name of the planet closest to the sun?", ["Mercury", "Venus", "Mars", "Jupiter"], "Mercury")
  ];

  List<Question> getQuizChallenge(int numberOfQuestions) {
    _questionBank.shuffle();
    return _questionBank.sublist(0, numberOfQuestions);
  }

    void nextQuestion(List<Question> quizChallenge) {
    if (_questionNumber < quizChallenge.length - 1) {
      _questionNumber++;
    }
  }

  String getQuestionText(List<Question> quizChallenge) {
    return quizChallenge[_questionNumber].questionText;
  }

  List<String> getQuestionOptions(List<Question> quizChallenge) {
    return quizChallenge[_questionNumber].questionOptions;
  }

  String getCorrectAnswer(List<Question> quizChallenge) {
    return quizChallenge[_questionNumber].questionAnswer;
  }

  //TODO: - Create a method called isFinished() here that checks to see if we have reached the last question. It should return (have an output) true if we've reached the last question and it should return false if we're not there yet.

  bool isFinished(List<Question> quizChallenge) {
    if (_questionNumber >= quizChallenge.length - 1) {
      //TODO: - Use a print statement to check that isFinished is returning true when you are indeed at the end of the quiz and when a restart should happen.

      print('Now returning true');
      return true;

    } else {
      return false;
    }
  }

  //TODO: - Create a reset() method here that sets the questionNumber back to 0.
  void reset() {
    _questionNumber = 0;
  }
}
