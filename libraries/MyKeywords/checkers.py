import requests
import time
import logging

logger = logging.getLogger(__name__)


def check_url(url, latency_threshold):
    latency_threshold = float(latency_threshold)
    headers = {"Accept": "application/json"}
    try:
        logger.info(f"Checking url: {url} and threshold {latency_threshold}")
        start_time = time.time()
        response = requests.get(url, headers=headers)
        end_time = time.time()

        latency = end_time - start_time
        logger.info(
            f"latency was {latency}, code: {response.status_code} and rsp: {response.text}"
        )
        if response.status_code != 200:
            return False
        if latency > latency_threshold:
            return False
        return True
    except requests.RequestException as e:
        logger.error(f"An error occurred: {e}")
