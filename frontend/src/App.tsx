// src/App.tsx
import { Game } from './components/Game';

function App() {
  return (
    <div className="min-h-screen bg-gray-100">
      <header className="bg-slate-800 text-white p-6 shadow-lg">
        <h1 className="text-3xl font-bold text-center">Game Demo</h1>
      </header>
      <main className="container mx-auto px-4 py-8">
        <Game />
      </main>
    </div>
  );
}

export default App;