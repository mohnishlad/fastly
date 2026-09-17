import './App.css'

const movieReviews = [
  {
    title: 'Dune: Part Two',
    score: '9.3/10',
    blurb:
      'A larger, richer cinematic journey that balances spectacle, political tension, and emotional payoff.',
  },
  {
    title: 'The Batman',
    score: '8.8/10',
    blurb:
      'Dark, moody, and relentlessly character-driven, with a detective story that feels genuinely fresh.',
  },
  {
    title: 'Past Lives',
    score: '9.1/10',
    blurb:
      'Quiet, intimate, and deeply human, delivering one of the most thoughtful relationship stories in recent memory.',
  },
  {
    title: 'Spider-Man: Across the Spider-Verse',
    score: '9.4/10',
    blurb:
      'A vibrant visual feast that turns animation into emotional storytelling without losing momentum.',
  },
]

const tvReviews = [
  {
    title: 'Shōgun',
    score: '9.5/10',
    blurb:
      'Brilliantly paced and incredibly immersive, with production design and performances that feel epic in every frame.',
  },
  {
    title: 'The Bear',
    score: '8.9/10',
    blurb:
      'High-pressure drama with sincerity, wit, and a real sense of chaos that makes it compelling.',
  },
  {
    title: 'Only Murders in the Building',
    score: '8.6/10',
    blurb:
      'A charming mystery series that keeps its humor sharp and its heart unexpectedly warm.',
  },
  {
    title: 'The Last of Us',
    score: '9.2/10',
    blurb:
      'Thoughtful, emotional, and full of tension, making each episode feel like a meaningful character study.',
  },
]

function App() {
  return (
    <div className="page-shell">
      <header className="topbar">
        <div className="brand">CineScope</div>
        <nav className="nav" aria-label="Main navigation">
          <a href="#home">Home</a>
          <a href="#movies">Movies</a>
          <a href="#tv-series">TV Series</a>
          <a href="#about">About</a>
        </nav>
      </header>

      <main>
        <section id="home" className="hero section-card">
          <div className="hero-copy">
            <p className="eyebrow">Fresh takes, honest opinions</p>
            <h1>Movie and TV reviews that feel worth your time.</h1>
            <p className="lede">
              CineScope is a lightweight review journal for standout films and series,
              from big-screen epics to intimate character stories.
            </p>
            <div className="cta-row">
              <a href="#movies" className="primary-button">Read reviews</a>
              <a href="#about" className="secondary-button">Learn more</a>
            </div>
          </div>
          <div className="hero-panel" aria-label="Featured review summary">
            <p className="panel-label">Featured pick</p>
            <h2>Shōgun</h2>
            <p>Power, culture, and precision storytelling wrapped into one unforgettable series.</p>
            <div className="score-pill">9.5/10</div>
          </div>
        </section>

        <section id="movies" className="content-section">
          <div className="section-heading">
            <p className="eyebrow">Movies</p>
            <h2>Recent favorites</h2>
          </div>
          <div className="card-grid">
            {movieReviews.map((movie) => (
              <article className="review-card" key={movie.title}>
                <span className="score-tag">{movie.score}</span>
                <h3>{movie.title}</h3>
                <p>{movie.blurb}</p>
              </article>
            ))}
          </div>
        </section>

        <section id="tv-series" className="content-section">
          <div className="section-heading">
            <p className="eyebrow">TV series</p>
            <h2>Best of the small screen</h2>
          </div>
          <div className="card-grid">
            {tvReviews.map((show) => (
              <article className="review-card" key={show.title}>
                <span className="score-tag">{show.score}</span>
                <h3>{show.title}</h3>
                <p>{show.blurb}</p>
              </article>
            ))}
          </div>
        </section>

        <section id="about" className="content-section about-section">
          <div className="section-heading">
            <p className="eyebrow">About</p>
            <h2>Why this site exists</h2>
          </div>
          <div className="about-box">
            <p>
              CineScope is built for people who want quick, thoughtful recommendations without the noise.
              The goal is simple: spotlight the movies and shows worth your attention and keep the reading experience clean, focused, and easy to enjoy.
            </p>
          </div>
        </section>
      </main>
    </div>
  )
}

export default App
