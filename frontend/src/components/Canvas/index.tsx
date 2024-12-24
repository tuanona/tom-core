// src/components/Canvas/index.tsx
import React, { useRef, useEffect } from 'react';

interface CanvasProps {
  position: { x: number; y: number };
}

export const GameCanvas: React.FC<CanvasProps> = ({ position }) => {
  const canvasRef = useRef<HTMLCanvasElement>(null);

  useEffect(() => {
    const canvas = canvasRef.current;
    if (!canvas) return;

    const ctx = canvas.getContext('2d');
    if (!ctx) return;

    // Clear canvas
    ctx.clearRect(0, 0, canvas.width, canvas.height);

    // Draw grid
    ctx.strokeStyle = '#ddd';
    const gridSize = 20;
    for (let x = 0; x <= canvas.width; x += gridSize) {
      ctx.beginPath();
      ctx.moveTo(x, 0);
      ctx.lineTo(x, canvas.height);
      ctx.stroke();
    }
    for (let y = 0; y <= canvas.height; y += gridSize) {
      ctx.beginPath();
      ctx.moveTo(0, y);
      ctx.lineTo(canvas.width, y);
      ctx.stroke();
    }

    // Draw player
    ctx.fillStyle = 'blue';
    ctx.fillRect(
      position.x + canvas.width / 2,
      position.y + canvas.height / 2,
      20,
      20
    );
  }, [position]);

  return (
    <div className='flex flex-col items-center'>
      <canvas
        ref={canvasRef}
        width={600}
        height={400}
        className='border-2 border-slate-300 rounded-lg shadow-md bg-white'
        />
        <p className='mt-2 text-sm text-slate-500'>
          Use arrow keys to move the square
        </p>
    </div>
  );
};