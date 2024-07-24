"""
This file contains all partial algorithm functions, that are normally executed
on all nodes for which the algorithm is executed.

The results in a return statement are sent to the vantage6 server (after
encryption if that is enabled). From there, they are sent to the partial task
or directly to the user (if they requested partial results).
"""

import pandas as pd
from vantage6.algorithm.tools.decorators import data


@data(1)
def read_csv(df1: pd.DataFrame) -> dict:
    return df1.to_dict()
