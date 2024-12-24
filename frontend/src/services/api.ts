// src/services/api.ts
import { Position } from '../types/game';

const BASE_URL = 'http://localhost:8080';

export const gameApi = {
  async getPosition(): Promise<Position> {
    const response = await fetch(`${BASE_URL}/position`);
    if (!response.ok) throw new Error('Failed to fetch position');
    return response.json();
  },

  async updatePosition(position: Position): Promise<void> {
    const response = await fetch(`${BASE_URL}/position`, {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json',
      },
      body: JSON.stringify(position),
    });
    if (!response.ok) throw new Error('Failed to update position');
  }
};