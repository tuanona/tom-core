// src/services/api.ts
import { Position } from '../types/game';

const BASE_URL = 'https://8080-idx-core-1735060440112.cluster-3g4scxt2njdd6uovkqyfcabgo6.cloudworkstations.dev';

export const gameApi = {
  async getPosition(): Promise<Position> {
    const response = await fetch(`${BASE_URL}/position`, {
      method: 'GET',
      headers: {
        'Content-Type': 'application/json',
      },
      credentials: 'include',
    });
    
    if (!response.ok) throw new Error('Failed to fetch position');
    return response.json();
  },

  async updatePosition(position: Position): Promise<void> {
    const response = await fetch(`${BASE_URL}/position`, {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json',
      },
      credentials: 'include',
      body: JSON.stringify(position),
    });
    
    if (!response.ok) throw new Error('Failed to update position');
  }
};
