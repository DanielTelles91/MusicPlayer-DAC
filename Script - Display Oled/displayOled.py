import time
import requests
from PIL import Image, ImageDraw, ImageFont
import Adafruit_SSD1306

# Inicializa o display
disp = Adafruit_SSD1306.SSD1306_128_32(rst=None)
disp.begin()
disp.clear()
disp.display()

width = disp.width
height = disp.height
image = Image.new('1', (width, height))
draw = ImageDraw.Draw(image)
font = ImageFont.load_default()

fonte = ImageFont.truetype("lcddot_tr.ttf", 45)

# Loop principal
while True:
    try:
        # Consulta o estado do player
        response = requests.get('http://localhost:3000/api/v1/getstate')
        data = response.json()

        status = data.get('status', 'stop')
        seconds = int(data.get('seek', 0)) // 1000
        tempo = time.strftime('%M:%S', time.gmtime(seconds))
        is_random = data.get('random', False)

        # Limpa a tela
        draw.rectangle((0, 0, width, height), outline=0, fill=0)

        # Desenha o símbolo de status
        if status == "play":
            draw.polygon([(2, 11), (2, 27), (14, 19)], fill=255)  # ▶
        elif status == "pause":
            draw.rectangle((2, 11, 6, 27), fill=255)
            draw.rectangle((10, 11, 14, 27), fill=255)           # ||
        elif status == "stop":
            draw.rectangle((2, 11, 14, 27), fill=255)             # ■

        # Tempo decorrido
        draw.text((24, 10), tempo, font=fonte, fill=255)
	
        # Modo aleatório
        if is_random:
            draw.text((100, 0), "RAND", font=font, fill=255)

        # Atualiza o display
        disp.image(image)
        disp.display()

        #time.sleep(1)

    except Exception as e:
        print("Erro:", e)
        time.sleep(2)