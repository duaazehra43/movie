class Movies {
  const Movies({
    this.name,
    this.description,
    this.heroName,
    this.pathImage,
    this.movies,
    this.rawColor,
  });

  final String? name;
  final String? heroName;
  final String? description;
  final String? pathImage;
  final List<MovieDetails>? movies;
  final int? rawColor;

  static const Moviess = [
    Movies(
      heroName: 'Harry Potter',
      name: 'Daniel Radcliffe',
      description: 'Harry Potter is a series of seven fantasy novels written by'
          ' British author J. K. Rowling. The novels chronicle the lives'
          ' of a young wizard, Harry Potter, and his friends Hermione'
          ' Granger and Ron Weasley, all of whom are students at'
          ' Hogwarts School of Witchcraft and Wizardry.',
      pathImage: 'assets/harrypotter.png',
      movies: MovieDetails.harryPotterMovies,
      rawColor: 0xffA41209,
    ),
    Movies(
      heroName: 'The lord of the rings',
      name: 'Frodo and Aragorn ',
      description:
          'The Lord of the Rings is a trilogy of epic fantasy adventure'
          ' films directed by Peter Jackson, based on the novel The'
          " Lord of the Rings by British author J. R. R. Tolkien. The"
          ' films are subtitled The Fellowship of the Ring, The Two'
          ' Towers, and The Return of the King.',
      pathImage: 'assets/lordRings.png',
      movies: MovieDetails.lordRingsMovies,
      rawColor: 0xffB3790F,
    ),
    Movies(
      heroName: 'The god father',
      name: 'Michael Corleone',
      description: 'Don Vito Corleone, head of a mafia family, decides to hand'
          ' over his empire to his youngest son, Michael. However, his'
          ' decision unintentionally puts the lives of his loved ones in'
          ' grave danger.',
      pathImage: 'assets/godfather.png',
      movies: MovieDetails.godFatherMovies,
      rawColor: 0xff3E4953,
    ),
    Movies(
      heroName: 'Black Widow',
      name: 'Natasha Romanova',
      description:
          'The first and best-known Black Widow is a Russian agent trained'
          ' as a spy, martial artist, and sniper, '
          'and outfitted with an arsenal of high-tech weaponry, including a'
          ' pair of wrist-mounted energy weapons '
          'dubbed her "Widow\'s Bite". She wears no costume during her firs'
          't few appearances but simply evening wear and a veil.',
      pathImage: 'assets/blackwidow-a.png',
      movies: MovieDetails.blackWidowMovies,
      rawColor: 0xff011535,
    ),
    Movies(
      heroName: 'Captain America',
      name: 'Steve Rogers',
      description:
          'Captain America is the alter ego of Steve Rogers, a frail young '
          'man enhanced to the peak of human perfection '
          "by an experimental serum to aid the United States government's"
          ' efforts in World War II. Near the end of the war, '
          'he was trapped in ice and survived in suspended animation until'
          ' he was revived in modern times.',
      pathImage: 'assets/captain-b.png',
      movies: MovieDetails.captainAmericaMovies,
      rawColor: 0xff0232CB,
    ),
  ];
}

class MovieDetails {
  const MovieDetails(
    this.title,
    this.rate,
    this.urlImage,
  );

  final String title;
  final double rate;
  final String urlImage;

  static const blackWidowMovies = [
    MovieDetails(
      'Black Widow',
      10,
      'https://upload.wikimedia.org/wikipedia/en/e/e9/Black_Widow_%282021_film%29_poster.jpg',
    )
  ];

  static const captainAmericaMovies = [
    MovieDetails(
      'Captain America: The First Avenger',
      7.8,
      'https://upload.wikimedia.org/wikipedia/en/3/37/Captain_America_The_First_Avenger_poster.jpg',
    ),
    MovieDetails(
      'Captain America: The Winter Soldier',
      9.3,
      'https://upload.wikimedia.org/wikipedia/en/9/9e/Captain_America_The_Winter_Soldier_poster.jpg',
    ),
    MovieDetails(
      'Captain America: Civil War',
      8.7,
      'https://upload.wikimedia.org/wikipedia/en/5/53/Captain_America_Civil_War_poster.jpg',
    ),
  ];

  static const lordRingsMovies = [
    MovieDetails(
      'The Fellowship of the Ring',
      8.9,
      'https://upload.wikimedia.org/wikipedia/en/8/8a/The_Lord_of_the_Rings%2C_TFOTR_%282001%29.jpg',
    ),
    MovieDetails(
      'The Two Towers',
      8.8,
      'https://upload.wikimedia.org/wikipedia/en/f/fc/The_Lord_of_the_Rings%2C_T2T_%282002%29.jpg',
    ),
    MovieDetails(
      'The Return of the King',
      9.0,
      'https://upload.wikimedia.org/wikipedia/en/2/23/The_Lord_of_the_Rings%2C_TROTK_%282003%29.jpg',
    ),
  ];
  static const harryPotterMovies = [
    MovieDetails(
      'Harry Potter and the Philosopher' 's Stone',
      7.6,
      'https://upload.wikimedia.org/wikipedia/en/7/7a/Harry_Potter_and_the_Philosopher%27s_Stone_banner.jpg',
    ),
    MovieDetails(
      'Harry Potter and the Chamber of Secrets',
      7.4,
      'https://upload.wikimedia.org/wikipedia/en/c/c0/Harry_Potter_and_the_Chamber_of_Secrets_movie.jpg',
    ),
    MovieDetails(
      'Harry Potter and the Prisoner of Azkaban',
      7.9,
      'https://upload.wikimedia.org/wikipedia/en/b/bc/Prisoner_of_azkaban_UK_poster.jpg',
    ),
    MovieDetails(
      'Harry Potter and the Goblet of Fire',
      7.7,
      'https://upload.wikimedia.org/wikipedia/en/c/c9/Harry_Potter_and_the_Goblet_of_Fire_Poster.jpg',
    ),
    MovieDetails(
      'Harry Potter and the Order of the Phoenix',
      7.5,
      'https://upload.wikimedia.org/wikipedia/en/e/e7/Harry_Potter_and_the_Order_of_the_Phoenix_poster.jpg',
    ),
    MovieDetails(
      'Harry Potter and the Half-Blood Prince',
      7.6,
      'https://upload.wikimedia.org/wikipedia/en/3/3f/Harry_Potter_and_the_Half-Blood_Prince_poster.jpg',
    ),
    MovieDetails(
      'Harry Potter and the Deathly Hallows – Part 1',
      7.7,
      'https://upload.wikimedia.org/wikipedia/en/2/2d/Harry_Potter_and_the_Deathly_Hallows_%E2%80%93_Part_1.jpg',
    ),
    MovieDetails(
      'Harry Potter and the Deathly Hallows – Part 2',
      8.1,
      'https://upload.wikimedia.org/wikipedia/en/d/df/Harry_Potter_and_the_Deathly_Hallows_%E2%80%93_Part_2.jpg',
    ),
  ];
  static const godFatherMovies = [
    MovieDetails(
      'The God Father I',
      9.2,
      'https://upload.wikimedia.org/wikipedia/en/1/1c/Godfather_ver1.jpg',
    ),
    MovieDetails(
      'The God Father II',
      9.0,
      'https://upload.wikimedia.org/wikipedia/en/0/03/Godfather_part_ii.jpg',
    ),
    MovieDetails(
      'The God Father III',
      7.6,
      'https://upload.wikimedia.org/wikipedia/en/5/55/GodfatherIII2.jpg',
    ),
  ];
}
