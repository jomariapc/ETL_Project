from sys import displayhook
import pylab as plt 
import pandas as pd
import seaborn as sns



def check_nan(df: pd.DataFrame) -> None:
    
    """ Función de Yona
    Recibe un dataframe y enseña el % de nulos y lo grafica
    """
    
    nan_cols = df.isna().mean() * 100  # % de valores nulos
    
    nan_cols = nan_cols[nan_cols>0]
    
    displayhook(f'N nan cols: {len(nan_cols)}')
    displayhook(nan_cols)

    # grafico de nulos en el dataframe

    #inicializa la figura
    plt.figure(figsize=(10, 6))  # 100X60  pixeles


    sns.heatmap(df.isna(),       # datos
                yticklabels=False,  # quita las etiquetas del eje y
                cmap='viridis',      # mapa de color
                cbar=False           # sin barra lateral
               )

    plt.show();


def column_unification(df):

    #Remove spaces from rows
    for col in df.select_dtypes(include='object'):
        df[col] = df[col].str.strip()

    #Lowercase and spaces with _
    df.columns = [c.lower().replace(' ', '_') for c in df.columns]

    return df


def column_to_list(column):
    ls=[]
    for e in column:
        for s in str(e).split(','):
            ls.append(s)

    return ls

def rename_columns(df, dictio):
    """
    Function to change the name of the columns specified in the dictio param
    
    """    
    return df.rename(columns=dictio)




def split_string(string, character, wish_len, filler):

    lst= string.split(character)
    if(len(lst)<wish_len):
        for i in range(wish_len-len(lst)):
            lst.append(filler)
    elif(len(lst)>wish_len):
        for i in range(len(lst)-wish_len):
            lst.pop()
    
    return lst 

#So proud of this function :D
def fill_column(row, df_to_compare, column_to_compare, column_to_change):
    
    if row[column_to_compare] in df_to_compare[column_to_compare].values:
        
        matching_row = df_to_compare[df_to_compare[column_to_compare] == row[column_to_compare]]
        
        row[column_to_change] = matching_row[column_to_change].values[0]

    return row


def replace_to(string, change_for, change_to):

    """
    Function that replace 'change_for' for 'change_to' in string

    It is usefull for the comma character in a  spanish float number, for the dot in an english one

    return the string with the replace function
    
    """

    return string.replace(change_for, change_to)


def change_type(df, column, type_from, type_to):

    """
    Function to change a given column from a given DataFrame 
    from 'type_from'
    to 'type_to'

    return the modified DataFrame
    
    """


    #If the type from is object
    if type_from == 'object':

        if df[column].dtype == 'object':

            df[column]= pd.to_numeric(df[column]) 

            #If the type to is float
            if type_to=='float':
                df[column] = df[column].astype(float)

            #If the type to is int                
            elif type_to=='int':
                df[column] = df[column].astype(int)

    

    #If the type from is float
    elif type_from == 'float':

        if df[column].dtype == 'float':

            df[column]= pd.to_numeric(df[column]) 

            #If the type to is object
            if type_to=='float':
                df[column] = df[column].astype(float)

            #If the type to is int    
            elif type_to=='int':
                df[column] = df[column].astype(int)

    

    #If the type from is int
    elif type_from == 'int64':

        if df[column].dtype == 'int64':

            df[column]= pd.to_numeric(df[column]) 

            #If the type to is object
            if type_to=='float':
                df[column] = df[column].astype(float)

            #If the type to is int    
            elif type_to=='object':
                df[column] = df[column].astype(object)


    return df