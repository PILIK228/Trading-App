"""Add Operation

Revision ID: 6d09d37fade0
Revises: 0a07d89b8fbd
Create Date: 2023-05-11 14:22:55.816221

"""
from alembic import op
import sqlalchemy as sa


# revision identifiers, used by Alembic.
revision = '6d09d37fade0'
down_revision = '0a07d89b8fbd'
branch_labels = None
depends_on = None


def upgrade() -> None:
    # ### commands auto generated by Alembic - please adjust! ###
    op.create_table('operation',
    sa.Column('id', sa.Integer(), nullable=False),
    sa.Column('quantity', sa.String(), nullable=True),
    sa.Column('figi', sa.String(), nullable=True),
    sa.Column('instrument_type', sa.String(), nullable=True),
    sa.Column('date', sa.TIMESTAMP(), nullable=True),
    sa.Column('type', sa.String(), nullable=True),
    sa.PrimaryKeyConstraint('id')
    )
    # ### end Alembic commands ###


def downgrade() -> None:
    # ### commands auto generated by Alembic - please adjust! ###
    op.create_table('cities',
    sa.Column('id', sa.INTEGER(), server_default=sa.text("nextval('cities_id_seq'::regclass)"), autoincrement=True, nullable=False),
    sa.Column('name', sa.VARCHAR(length=30), autoincrement=False, nullable=True),
    sa.Column('country', sa.VARCHAR(length=30), autoincrement=False, nullable=True),
    sa.Column('lat', sa.NUMERIC(), autoincrement=False, nullable=True),
    sa.Column('lon', sa.NUMERIC(), autoincrement=False, nullable=True),
    sa.PrimaryKeyConstraint('id', name='cities_pkey'),
    postgresql_ignore_search_path=False
    )
    op.create_table('prediction',
    sa.Column('id', sa.INTEGER(), autoincrement=True, nullable=False),
    sa.Column('cities_id', sa.INTEGER(), autoincrement=False, nullable=False),
    sa.Column('dates', sa.VARCHAR(length=30), autoincrement=False, nullable=True),
    sa.Column('temperature', sa.INTEGER(), autoincrement=False, nullable=True),
    sa.Column('description', sa.VARCHAR(length=30), autoincrement=False, nullable=True),
    sa.ForeignKeyConstraint(['cities_id'], ['cities.id'], name='prediction_cities_id_fkey'),
    sa.PrimaryKeyConstraint('id', name='prediction_pkey')
    )
    op.drop_table('operation')
    # ### end Alembic commands ###
