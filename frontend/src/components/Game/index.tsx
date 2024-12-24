// src/components/Game/index.tsx
import React, { useEffect, useState } from 'react';
import { GameCanvas } from '../Canvas';
import { gameApi } from '../../services/api';
import { Position } from '../../types/game';

export const Game: React.FC = () => {
  const [position, setPosition] = useState<Position>({ x: 0, y: 0 });
  const [error, setError] = useState<string | null>(null);

  useEffect(() => {
    const fetchInitialPosition = async () => {
      try {
        const pos = await gameApi.getPosition();
        setPosition(pos);
        setError(null);
      } catch {
        setError('Failed to connect to server');
      }
    };
    fetchInitialPosition();
  }, []);

  useEffect(() => {
    const handleKeyPress = async (event: KeyboardEvent) => {
      const moveSpeed = 5;
      const newPosition = { ...position };

      switch (event.key) {
        case 'ArrowUp':
          newPosition.y -= moveSpeed;
          break;
        case 'ArrowDown':
          newPosition.y += moveSpeed;
          break;
        case 'ArrowLeft':
          newPosition.x -= moveSpeed;
          break;
        case 'ArrowRight':
          newPosition.x += moveSpeed;
          break;
        default:
          return;
      }

      try {
        await gameApi.updatePosition(newPosition);
        setPosition(newPosition);
        setError(null);
      } catch {
        setError('Failed to update position');
      }
    };

    window.addEventListener('keydown', handleKeyPress);
    return () => window.removeEventListener('keydown', handleKeyPress);
  }, [position]);

  return (
    <div className="flex flex-col items-center p-4">
      {error && (
        <div className="text-red-500 mb-4">
          {error}
        </div>
      )}
      <GameCanvas position={position} />
      <div className="mt-4">
        Position: ({Math.round(position.x)}, {Math.round(position.y)})
      </div>
    </div>
  );
};
