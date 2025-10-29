import numpy as np
import matplotlib.pyplot as plt

# --- Frecuencias de los deltas (en Hz) ---
f = np.array([-2600, -1400, -600, 600, 1400, 2600])

# --- Amplitudes correspondientes ---
A = np.array([15/4, 15/4, 15/2, 15/2, 15/4, 15/4])

# --- Gráfico del espectro en frecuencia ---
plt.figure(figsize=(8, 4))
plt.stem(f, A, basefmt=" ")
plt.title("Espectro en frecuencia V(f)")
plt.xlabel("Frecuencia [Hz]")
plt.ylabel("Amplitud")
plt.grid(True)
plt.tight_layout()
plt.show()
