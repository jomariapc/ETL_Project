#CREATE DICTIONARY WITH THE COLUMN NAMES AND THE COLUMN TYPES
def create_dictio(df):

    column_types= {}

    for e in df:
        
        if ('object' in str(df[e].dtype)):
            column_types[e]='VARCHAR(50)'

        elif ('float' in str(df[e].dtype)):
            column_types[e]='FLOAT'

        elif ('int' in str(df[e].dtype)):
            column_types[e]='INT'

        else:
            column_types[e]='VARCHAR(50)'
        

    return column_types
        

#CREATE TABLES
def create_table(table_name, column_names_types):
    """
    Function that receives the name of the table "table_name", 
    a dictionary "column_names_types" with the format 
    key (column name): value(column type)  

    Returns the string with the query for create table

    """
    query=f'CREATE TABLE `{table_name}`('

    #Add all the columns to the string from the dictio

    for key, value in column_names_types.items():
        
        query= query + key + ' ' + value + ', '

    #Erase the last comma
    return query[0:-2] + ')'


#CREATE PRIMARY KEY
def create_pk(table_name, primary_key):

    return f'ALTER TABLE `{table_name}` ADD PRIMARY KEY ({primary_key});'

#CREATE FOREIGN KEY    
def create_fk(table_name, foreign_key, reference_table, reference_key):

    return f'ALTER TABLE `{table_name}` ADD FOREIGN KEY ({foreign_key}) REFERENCES `{reference_table}`({reference_key});'


