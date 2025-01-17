import { Position } from '../types/game.ts';

const CORE_API = 'http://localhost:2000/api';  // Updated API base URL

export const gameApi = {
  async getPosition(): Promise<Position> {
    const response = await fetch(`${CORE_API}/position`, {
      method: 'GET',
      headers: {
        'Content-Type': 'application/json',
      },
      credentials: 'include',
    });
    
    if (!response.ok) throw new Error('Failed to fetch position');
    return response.json();
  },

  async updatePosition(position: Position): Promise<Position> {
    const response = await fetch(`${CORE_API}/position`, {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json',
      },
      credentials: 'include',
      body: JSON.stringify(position),
    });
    
    if (!response.ok) throw new Error('Failed to update position');
    return response.json();
  },
};