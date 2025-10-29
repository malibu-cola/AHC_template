from loguru import logger

from src.data_handler.manager.input_manager import load_input
from src.data_handler.manager.output_manager import output_result
from src.solver import Solver
from src.utils.score import calculate_score


def solve() -> None:
    input_data = load_input()
    output_data = Solver().solve(input_data)
    score = calculate_score(input_data, output_data)
    if score is not None:
        logger.info(f"score: {score}")
    output_result(output_data)


if __name__ == "__main__":
    solve()
